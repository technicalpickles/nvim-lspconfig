--- default config for gradle-projects of the
--- kotlin-language-server: https://github.com/fwcd/kotlin-language-server
---
--- This server requires vim to be aware of the kotlin-filetype.
--- You could refer for this capability to:
--- 	https://github.com/udalov/kotlin-vim (recommended)
--- 	Note that there is no LICENSE specified yet.

local util = require 'lspconfig/util'
local configs = require 'lspconfig/configs'

local bin_name = "kotlin-language-server"
if vim.fn.has('win32') == 1 then
  bin_name = bin_name..".bat"
end

configs.kotlin_language_server = {
  default_config = {
    filetypes = { "kotlin" };
    root_dir = util.root_pattern("settings.gradle");
    cmd = { bin_name };
  };
  docs = {
    package_json = "https://raw.githubusercontent.com/fwcd/vscode-kotlin/master/package.json";
    description = [[
    A kotlin language server which was developed for internal usage and
    released afterwards. Maintaining is not done by the original author,
    but by fwcd.

    It is builded via gradle and developed on github.
    Source and additional description:
    https://github.com/fwcd/kotlin-language-server
    ]];
    default_config = {
      root_dir = [[root_pattern("settings.gradle")]];
      cmd = {"kotlin-language-server"};
      capabilities = [[
      smart code completion,
      diagnostics,
      hover,
      document symbols,
      definition lookup,
      method signature help,
      dependency resolution,
      additional plugins from: https://github.com/fwcd

      Snipped of License (refer to source for full License):

      The MIT License (MIT)

      Copyright (c) 2016 George Fraser
      Copyright (c) 2018 fwcd

      ]];
    };
  };
}

-- vim:et ts=2 sw=2