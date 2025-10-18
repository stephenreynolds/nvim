return {
  "mason-org/mason.nvim",
  build = ":MasonUpdate",
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    mr:on("package:install:success", function()
      vim.defer_fn(function()
        require("lazy.core.handler.event").trigger({
          event = "FileType",
          buf = vim.api.nvim_get_current_buf(),
        })
      end, 100)
    end)
    local function ensure_installed()
      local is_nixos = vim.fn.executable("nixos-version") == 1
      for _, tool in ipairs(opts.ensure_installed) do
        local should_install = true
        if is_nixos then
          local tools = {
            ["emmet-language-server"] = true,
            ["js-debug-adapter"] = true,
            ["php-debug-adapter"] = true,
            ["nginx-language-server"] = true,
          }
          should_install = tools[tool]
        end
        local p = mr.get_package(tool)
        if should_install and not p:is_installed() then
          p:install()
        end
      end
    end
    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}
