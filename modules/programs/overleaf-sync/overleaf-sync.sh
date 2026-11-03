# overleaf-sync: sync a local clone with the Overleaf git bridge.
#
#   overleaf-sync        commit local changes, rebase onto Overleaf, push
#   overleaf-sync pull   only pull
#
# Exit codes: 0 ok, 1 error, 2 not an Overleaf repo, 3 conflict (needs you)
#
# Packaged with writeShellApplication, which adds the shebang and
# `set -euo pipefail` and runs shellcheck at build time.

pattern="${OVERLEAF_REMOTE_PATTERN:-git\.overleaf\.com}"

root=$(git rev-parse --show-toplevel 2>/dev/null) || exit 2
cd "$root"
url=$(git remote get-url origin 2>/dev/null) || exit 2
[[ $url =~ $pattern ]] || exit 2

branch="${OVERLEAF_BRANCH:-}"
if [[ -z $branch ]]; then
  branch=$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null || true)
  branch="${branch#origin/}"
  [[ -n $branch ]] || branch=master
fi

# Checks both an unfinished rebase AND unmerged paths. They are different
# states: `pull --rebase --autostash` exits 0 when the rebase succeeds but
# popping the autostash conflicts, which leaves conflict markers in the tree
# and no rebase directory.
needs_attention() {
  local gd
  gd=$(git rev-parse --git-dir)
  [[ -e $gd/rebase-merge || -e $gd/rebase-apply || -e $gd/MERGE_HEAD ]] && return 0
  [[ -n $(git diff --name-only --diff-filter=U) ]]
}

if needs_attention; then
  echo "unresolved conflict: fix the markers, then git rebase --continue" >&2
  exit 3
fi

if [[ ${1:-} != pull ]]; then
  git add -A
  git diff --cached --quiet || git commit -q -m "sync: $(date '+%F %T')"
fi

if ! git pull -q --rebase --autostash origin "$branch"; then
  needs_attention && { echo "conflict during pull" >&2; exit 3; }
  echo "pull failed" >&2
  exit 1
fi
# Don't trust pull's exit code (see needs_attention)
needs_attention && { echo "conflict after pull (autostash)" >&2; exit 3; }

[[ ${1:-} == pull ]] && exit 0

if (( $(git rev-list --count origin/"$branch"..HEAD) > 0 )); then
  git push -q origin "HEAD:$branch"
fi
