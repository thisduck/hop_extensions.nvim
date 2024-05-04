local hop = require("hop")

local M = {}

function M.hint_char1(opts)
	local jump_regex = require('hop.jump_regex')

	opts = hop.opts

	local c = hop.get_input_pattern('Hop 1 char: ', 1)
	if not c then
		return
	end

	if c == ' ' then
		hop.hint_with_regex(jump_regex.regex_by_case_searching("\\v\\S\\zs ", false, opts), opts)
	else
		hop.hint_with_regex(jump_regex.regex_by_case_searching(c, true, opts), opts)
	end
end

function M.register(opts)
end

return M
