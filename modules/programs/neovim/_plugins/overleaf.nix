{ overleafSync, lib, ... }:
{
  plugins.vimtex.settings.compiler_latexmk.out_dir = "build";

  extraConfigLua = ''
    do
      local bin = "${lib.getExe overleafSync}"
      local running, last_pull = false, 0
      local skip = {}
      local timer = vim.uv.new_timer()

      local function run(dir, args)
        if running or skip[dir] then return end
        running = true
        vim.system(vim.list_extend({ bin }, args or {}), { cwd = dir, text = true }, function(r)
          running = false
          if r.code == 2 then skip[dir] = true end
          vim.schedule(function()
            if r.code == 3 then
              vim.notify("[overleaf] " .. vim.trim(r.stderr), vim.log.levels.WARN)
            elseif r.code ~= 0 and r.code ~= 2 then
              vim.notify("[overleaf] exit " .. r.code .. ": " .. vim.trim(r.stderr), vim.log.levels.ERROR)
            end
          end)
        end)
      end

      local group = vim.api.nvim_create_augroup("OverleafSync", { clear = true })
      local files = { "*.tex", "*.bib", "*.sty", "*.cls" }

      vim.api.nvim_create_autocmd("BufWritePost", {
        group = group,
        pattern = files,
        callback = function(ev)
          local dir = vim.fn.fnamemodify(ev.file, ":p:h")
          timer:stop()
          timer:start(2000, 0, vim.schedule_wrap(function() run(dir) end))
        end,
      })

      vim.api.nvim_create_autocmd("FocusGained", {
        group = group,
        callback = function()
          if not vim.bo.filetype:match("tex") then return end
          if os.time() - last_pull < 60 then return end
          last_pull = os.time()
          run(vim.fn.expand("%:p:h"), { "pull" })
        end,
      })

      vim.api.nvim_create_user_command("OverleafSync", function()
        run(vim.fn.expand("%:p:h"))
      end, {})
    end
  '';
}
