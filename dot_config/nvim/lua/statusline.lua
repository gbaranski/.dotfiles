local colors = require('globals.theme')
local gl = require('galaxyline')
local gls = gl.section

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

local separator = {
    right = '',
    left  = '',
}

gls.left = {
    {ViMode = {
        provider = function()
            local mode_color = mode_map[vim.fn.mode()][2] or colors.none
            local mode_text  = mode_map[vim.fn.mode()][1] or 'N/A'

	    local cmd1 = string.format('hi GalaxyViMode guifg=%s guibg=%s', colors.red, colors.red)
	    local cmd2 = string.format('hi GalaxyViModeInv guifg=%s guibg=%s', colors.red, colors.red)

	    vim.api.nvim_command(cmd1)
	    vim.api.nvim_command(cmd2)
	    return string.format('  %s ', mode_text)
        end,
	highlight = { colors.red, colors.red, 'bold' },
    }},
}

gl.load_galaxyline()
