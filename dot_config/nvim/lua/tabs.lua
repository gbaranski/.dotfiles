require('bufferline').setup{
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(_, _, diagnostics_dict)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " "
				or (e == "warning" and " " or "" )
				s = s .. n .. sym
			end
			return s
		end,
	}
}

nnoremap('[b', ':BufferLineCycleNext<CR>')
nnoremap(']b', ':BufferLineCyclePrev<CR>')
nnoremap('gb', ':BufferLinePick<CR>')

nnoremap('<A-1>', ':lua require("bufferline").go_to_buffer(1)<CR>')
nnoremap('<A-2>', ':lua require("bufferline").go_to_buffer(2)<CR>')
nnoremap('<A-3>', ':lua require("bufferline").go_to_buffer(3)<CR>')
nnoremap('<A-4>', ':lua require("bufferline").go_to_buffer(4)<CR>')
nnoremap('<A-5>', ':lua require("bufferline").go_to_buffer(5)<CR>')
nnoremap('<A-6>', ':lua require("bufferline").go_to_buffer(6)<CR>')
nnoremap('<A-7>', ':lua require("bufferline").go_to_buffer(7)<CR>')
nnoremap('<A-8>', ':lua require("bufferline").go_to_buffer(8)<CR>')
nnoremap('<A-9>', ':lua require("bufferline").go_to_buffer(9)<CR>')
