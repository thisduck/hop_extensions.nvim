local jump_target = require("hop.jump_target")
local hop = require("hop")

local M = {}
M.opts = {}

function M.hint_char1(opts)
	opts = nil

	local ok, c = pcall(vim.fn.getchar)
	if not ok then
		return
	end

	local generator = jump_target.jump_targets_by_scanning_lines

	if c == 32 then
		return hop.hint_with(generator(jump_target.regex_by_searching("\\v\\S\\zs ")), opts)
	end

	hop.hint_with(generator(jump_target.regex_by_case_searching(c, true, opts)), opts)
end

function M.register(opts)
	M.opts = opts
end

return M
