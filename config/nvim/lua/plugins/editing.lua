return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				additional_vim_regex_highlighting = false,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("nvim-treesitter.configs").setup({
				enable = true,
				multiwindow = false,
				max_lines = 0,
				min_window_height = 0,
				line_numbers = true,
				multiline_threshold = 20,
				trim_scope = "outer",
				mode = "cursor",
				separator = nil,
				zindex = 20,
				on_attach = nil,
			})
		end,
	},
	{
		"easymotion/vim-easymotion",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			vim.api.nvim_set_keymap("n", "<Leader>w", "<Plug>(easymotion-bd-w)", {})
			vim.api.nvim_set_keymap("n", "<Leader>k", "<Plug>(easymotion-bd-f)", {})
			vim.api.nvim_set_keymap("n", "<Leader>l", "<Plug>(easymotion-bd-jk)", {})
		end,
	},
	{
		-- `%` で対応する括弧に移動する。
		"andymass/vim-matchup",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		-- 括弧やクォートなどの片側を入力すると、対応するものも自動で入力される。
		"windwp/nvim-autopairs",
		lazy = true,
		event = { "InsertEnter" },
		config = true,
	},
	{
		"alvan/vim-closetag",
		lazy = true,
		event = { "InsertEnter" },
		ft = { "html", "xhtml", "phtml", "jsx", "tsx" },
		config = function()
			vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.tsx"
		end,
	},
	{
		-- カラーをプレビューする。
		"gorodinskiy/vim-coloresque",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"thinca/vim-quickrun",
		lazy = true,
		keys = {
			{
				"<leader>go",
				function()
					vim.cmd(":QuickRun")
				end,
				desc = "QuickRun",
			},
		},
	},
	{
		"LunarVim/bigfile.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("bigfile").setup({
				-- 1 MiB 以上のファイルを開いた場合に、いくつかの機能を無効化する。
				filesize = 1,
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = true,
		event = { "InsertEnter" },
		config = function()
			require("Comment").setup({
				-- line comment: Alt + /
				-- block comment: Alt + Shift + /
				toggler = {
					line = "÷",
					block = "¿",
				},
				opleader = {
					line = "÷",
					block = "¿",
				},
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		ft = { "markdown" },
		keys = {
			{
				"<leader>mp",
				function()
					vim.cmd(":MarkdownPreview")
				end,
				desc = "Markdown preview",
			},
		},
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		keys = {
			{
				",x",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Trouble",
			},
		},
		config = true,
	},
}
