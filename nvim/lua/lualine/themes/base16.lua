local colors = require("colors")
local base16 = {}

base16.normal = {
	a = { fg = colors.base01, bg = colors.base0D },
	b = { fg = colors.base05, bg = colors.base02 },
	c = { fg = colors.base04, bg = colors.base01 },
}

base16.insert = {
	a = { fg = colors.base01, bg = colors.base04 },
	b = { fg = colors.base06, bg = colors.base02 },
	y = {  fg = colors.base05, bg = colors.base02 },
}

base16.visual = {
	a = { fg = colors.base00, bg = colors.base07 },
	b = { fg = colors.base04, bg = colors.base02 },
	y = {  fg = colors.base05, bg = colors.base02 },
}

base16.replace = {
	a = { fg = colors.base00, bg = colors.base09 },
	b = { fg = colors.base04, bg = colors.base02 },
	y = {  fg = colors.base05, bg = colors.base02 },
}

base16.command = {
	a = { fg = colors.base00, bg = colors.base0E, gui = "bold" },
	b = { fg = colors.base04, bg = colors.base02 },
	y = {  fg = colors.base05, bg = colors.base02 },
}

base16.inactive = {
	a = { fg = colors.base04, bg = colors.base00, gui = "bold" },
	b = { fg = colors.base04, bg = colors.base00 },
	c = { fg = colors.base04, bg = colors.base01 },
}

return base16
