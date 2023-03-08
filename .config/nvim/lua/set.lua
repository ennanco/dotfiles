--Setcolorscheme
vim.opt.guicursor=""

---Enablethemouse
vim.opt.mouse='a'

vim.opt.clipboard="unnamedplus"
vim.opt.fileformat="unix"
vim.opt.encoding="utf-8"
vim.opt.backspace="indent,eol,start"
vim.opt.backup= false
vim.opt.swapfile=false
--vim.opt.wildmode="longest, list, full"
vim.opt.ttimeoutlen= 50
vim.opt.visualbell=true
--vim.opt.t_vb=""


vim.opt.nu=true
vim.opt.relativenumber=true

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.showmatch=true
vim.opt.showcmd=true
vim.opt.ruler=true

vim.opt.autoindent=true
vim.opt.smartindent=true

vim.opt.wrap=false

vim.opt.swapfile=false
vim.opt.backup=false
vim.opt.undodir=os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile=true

vim.opt.hlsearch=false
vim.opt.incsearch=true
vim.opt.ignorecase=true
vim.opt.smartcase=true

vim.opt.termguicolors=true

vim.opt.scrolloff=8
vim.opt.signcolumn="yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime=50

vim.opt.colorcolumn="80"

--vim.api.nvim_command("autocmd BufWritePre * %s/\\s\\+//e")

local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost",{
command= "silent! lua vim.highlight.on_yank()",
group= yankGrp,
})

---vim.opt.completeopt= 'menuone, noselect'
