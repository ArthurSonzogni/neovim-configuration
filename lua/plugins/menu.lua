return {
  "nvzone/menu",
  dependencies = { "nvzone/volt" },
  config = function()
    -- Keyboard users
    vim.keymap.set("n", "<C-t>", function()
      print("Hello from <C-t>")
      require("menu").open("default")
    end, {})

  -- mouse users + nvimtree users!
  vim.keymap.set("n", "<RightMouse>", function()
    print("Hello from <RightMouse>")
    vim.cmd.exec '"normal! \\<RightMouse>"'

    local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
    require("menu").open(options, { mouse = true })
  end, {})
  end,
}
