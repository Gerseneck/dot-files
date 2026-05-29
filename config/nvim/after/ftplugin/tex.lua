local config = require("nvim-surround.config")

require("nvim-surround").buffer_setup({
  surrounds = {
    ["e"] = {
      add = function()
        local result = config.get_input("Enter the environment name: ")

        if result then
          return {
            { "\\begin{" .. result .. "}" },
            { "\\end{" .. result .. "}" },
          }
        end
      end,
      find = function() end,
      delete = function() end,
    },
    ["c"] = {
      add = function()
        local result = config.get_input("Enter the command name: ")

        if result then
          return {
            { "\\" .. result .. "{" },
            { "}" },
          }
        end
      end,
      find = function() end,
      delete = function() end,
    },
  },
})
