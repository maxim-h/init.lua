return {
  "Vigemus/iron.nvim",
  ft = {"python"},
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")


    iron.setup({
      config = {
        repl_definition = {
          python = {
            command = { "pixi", "run", "ipython", "--no-autoindent" },
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
            env = { PYTHON_BASIC_REPL = "1" },
          },
        },
        -- repl_open_cmd = view.split.vertical.botright(50),
        repl_open_cmd = view.offset({
            width = 50,
            height = vim.o.lines * 0.5 - 2,
            w_offset = view.helpers.flip(2),  -- pinned to right side
            h_offset = view.helpers.proportion(0.85),  -- pinned to top
        })
      },
      keymaps = {
        toggle_repl = "<space>rf",
        restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
        send_motion = "<space>sc",
        visual_send = "<space>sc",
        send_file = "<space>sf",
        send_line = "<space>sl",
      },
    })
  end,
}
