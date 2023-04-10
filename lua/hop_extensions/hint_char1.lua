local hop = require("hop")

local M = {}
M.opts = {}

function M.hint_char1(opts)
	opts = M.opts or {}
	local jump_target = require 'hop.jump_target'

	local c = hop.get_input_pattern('Hop 1 char: ', 1)
	if not c then
		return
	end

	local generator
	if opts.current_line_only then
		generator = jump_target.jump_targets_for_current_line
	else
		generator = jump_target.jump_targets_by_scanning_lines
	end

	if c == ' ' then
		return hop.hint_with(generator(jump_target.regex_by_searching("\\v\\S\\zs ")), opts)
	end

	hop.hint_with(
		generator(jump_target.regex_by_case_searching(c, true, opts)),
		opts
	)
end

function M.register(opts)
	M.opts = opts
end

return M
