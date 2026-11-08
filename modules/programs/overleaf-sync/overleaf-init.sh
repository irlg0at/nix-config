# overleaf-init: wire a clone up to the Overleaf git bridge.
#
#   overleaf-init                 configure the repo in the current directory
#   overleaf-init PROJECT_ID DIR  clone it first, then configure
#   overleaf-init URL [DIR]
#
# Credentials come from the host-scoped helper in the git wrapper, so nothing
# is stored per repo.
#
# Packaged with writeShellApplication, which adds the shebang and
# `set -euo pipefail` and runs shellcheck at build time.

pattern="${OVERLEAF_REMOTE_PATTERN:-git\.overleaf\.com}"

if [[ -n ${1:-} ]]; then
  case $1 in
    https://*) url=$1 ;;
    *) url="https://git.overleaf.com/$1" ;;
  esac
  dir="${2:-$(basename "$url")}"
  git clone "$url" "$dir"
  cd "$dir"
fi

root=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "not inside a git repository" >&2
  exit 1
}
cd "$root"

url=$(git remote get-url origin 2>/dev/null) || {
  echo "no origin remote" >&2
  exit 1
}
[[ $url =~ $pattern ]] || {
  echo "origin is not an Overleaf git bridge: $url" >&2
  exit 1
}

git config --local core.fileMode false
git config --local pull.rebase true

git config --local --unset-all credential.helper 2>/dev/null || true
gd=$(git rev-parse --absolute-git-dir)
rm -f "$gd/credentials"

if ! git symbolic-ref --quiet refs/remotes/origin/HEAD >/dev/null; then
  git remote set-head origin --auto >/dev/null || echo "warning: could not determine origin/HEAD" >&2
fi

if [[ -s .gitignore && -n $(tail -c1 .gitignore) ]]; then
  echo >> .gitignore
fi
if ! grep -qxF 'build/' .gitignore 2>/dev/null; then
  echo 'build/' >> .gitignore
fi

branch=$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null || true)
echo "configured ${root} -> ${url} (${branch:-origin/HEAD unknown})"
