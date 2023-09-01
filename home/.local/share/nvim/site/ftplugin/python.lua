vim.lsp.start({
	name = 'python-language-server',
	cmd = { 'pylsp' },
	root_dir = vim.fs.dirname(vim.fs.find({ 'pyproject.toml', 'setup.py' }, { upward = true })[1]),
	autostart = true,
	filetypes = { "python" },
	settings = {
		pylsp = {
			plugins = {
				flake8 = {
					enabled = true,
				},
				autopep8 = {
					enabled = false,
				},
				maccabe = {
					enabled = false,
				},
				pycodestyle = {
					enabled = false,
				},
				pyflakes = {
					enabled = false,
				},
				yapf = {
					enabled = false,
				},
				mypy = {
					enabled = true,
				},
			}
		}
	}
})
