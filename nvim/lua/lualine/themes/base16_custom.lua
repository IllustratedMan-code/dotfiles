local status, colors = pcall(require, "colors")
if(!status) then
    colors = {
         base00="2E3440",
         base01="3B4252",
         base02="434C5E",
         base03="4C566A",
         base04="D8DEE9",
         base05="E5E9F0",
         base06="ECEFF4",
         base07="8FBCBB",
         base08="BF616A",
         base09="D08770",
         base0A="EBCB8B",
         base0B="A3BE8C",
         base0C="88C0D0",
         base0D="81A1C1",
         base0E="B48EAD",
         base0F="5E81AC",
        }
end



local base16_custom = {}

base16_custom.normal = {
	a = { fg = colors.base01, bg = colors.base0D },
	b = { fg = colors.base05, bg = colors.base02 },
	c = { fg = colors.base04, bg = colors.base01 },
}

base16_custom.insert = {
	a = { fg = colors.base01, bg = colors.base04 },
	b = { fg = colors.base06, bg = colors.base02 },
	y = {  fg = colors.base05, bg = colors.base02 },
}

base16_custom.visual = {
	a = { fg = colors.base00, bg = colors.base07 },
	b = { fg = colors.base04, bg = colors.base02 },
	y = {  fg = colors.base05, bg = colors.base02 },
}

base16_custom.replace = {
	a = { fg = colors.base00, bg = colors.base09 },
	b = { fg = colors.base04, bg = colors.base02 },
	y = {  fg = colors.base05, bg = colors.base02 },
}


base16_custom.inactive = {
	a = { fg = colors.base04, bg = colors.base00, gui = "bold" },
	b = { fg = colors.base04, bg = colors.base00 },
	c = { fg = colors.base04, bg = colors.base01 },
}

base16_custom.command = base16_custom.insert
base16_custom.terminal = base16_custom.insert

return base16_custom
