local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local lsp_status = require('lsp-status')
local gls = gl.section

lsp_status.config {
  diagnostics = false,
  indicator_errors = '  ',
  indicator_warnings = '  ',
  indicator_info = '  ',
  indicator_hint = '  ',
  indicator_ok = ' 﫟 ',
}

gl.short_line_list = {
    'LuaTree',
}


colors = {
  transparent = '#00000000',
  bg = "#2c2e34",
  blue = "#76cce0",
  blue_dark = "#354157",
  green = "#9ed072",
  yellow = "#e7c664",
  red = "#fc5d7c",
  red_alt = "#ff6077",
  red_dark = "#55393d",
  purple = "#b39df3",
  grey = "#7f8490",
}


local mode_map = {
    ['n']  = {'NORMAL'  , colors.green     },
    ['i']  = {'INSERT'  , colors.red       },
    ['R']  = {'REPLACE' , colors.blue      },
    ['v']  = {'VISUAL'  , colors.blue      },
    ['V']  = {'V-LINE'  , colors.blue_dark },
    ['c']  = {'COMMAND' , colors.yellow    },
    ['s']  = {'SELECT'  , colors.red_alt   },
    ['S']  = {'S-LINE'  , colors.red_dark  },
    ['t']  = {'TERMINAL', colors.purple    },
    [''] = {'V-BLOCK' , colors.blue      },
    [''] = {'S-BLOCK' , colors.blue_alt  },
    ['Rv'] = {'VIRTUAL' , colors.grey      },
    ['rm'] = {'--MORE'  , colors.grey      },
}

local separator = ' '

gls.left[0] = {
  ViMode = {
    provider = function()
      local mode_color = mode_map[vim.fn.mode()][2] or colors.none
      local mode_text  = mode_map[vim.fn.mode()][1] or 'N/A'

      local cmd1 = string.format('hi GalaxyViMode guibg=%s', mode_color)
      local cmd2 = string.format('hi GalaxyViModeInv guibg=%s', mode_color)

      vim.api.nvim_command(cmd1)
      vim.api.nvim_command(cmd2)
      return string.format('  %s ', mode_text)
    end,
    separator = separator,
    highlight = { colors.bg, colors.transparent, 'bold' },
  }
}

gls.left[1] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    separator = separator,
    highlight = { colors.purple, colors.transparent, 'bold' }
  }
}

gls.left[2] = {
  LspStatus = {
    condition = condition.check_active_lsp,
    provider = function()
        return lsp_status.status()
    end,
    separator = separator,
    highlight = { colors.purple, colors.transparent, 'bold' }
  }
}

-- gls.right[0] = {
--   DiagnosticError = {
--     condition = condition.check_active_lsp,
--     provider = function()
--       return lsp_status.diagnostics()
--     end,
--     separator = separator,
--     highlight = { colors.purple, colors.transparent, 'bold' }
--   }
-- }

-- gl.load_galaxyline()
