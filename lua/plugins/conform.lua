require("conform").setup({
	formatters_by_ft = {
		["_"] = { "prettier" },
		lua = { "stylua" },
	},
})
