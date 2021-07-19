-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/houlong/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/houlong/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/houlong/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/houlong/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/houlong/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["dashboard-nvim"] = {
    config = { 'require("plugin_settings.dashboard")' },
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { 'require("plugin_settings.galaxyline")' },
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("plugin_settings.gitsigns")' },
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { 'require("lsp.saga")' },
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  mkdx = {
    config = { 'require("plugin_settings.mkdx")' },
    loaded = false,
    needs_bufread = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/opt/mkdx"
  },
  ["nord-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/opt/nord-vim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("nvim-autopairs").setup()' },
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-comment"] = {
    config = { 'require("plugin_settings.comment")' },
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    config = { 'require("plugin_settings.compe")' },
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    config = { 'require("plugin_settings.dap")' },
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("plugin_settings.tree")' },
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim-whichkey-setup.lua"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/nvim-whichkey-setup.lua"
  },
  ["onedark.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/opt/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    config = { 'require("plugin_settings.telescope")' },
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-one"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/opt/vim-one"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-terminal-help"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/vim-terminal-help"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  vimtex = {
    config = { 'require("plugin_settings.vimtex")' },
    loaded = false,
    needs_bufread = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  ["zyt-snippet"] = {
    loaded = true,
    path = "/home/houlong/.local/share/nvim/site/pack/packer/start/zyt-snippet"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("plugin_settings.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("plugin_settings.tree")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
require("plugin_settings.compe")
time([[Config for nvim-compe]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
require("plugin_settings.comment")
time([[Config for nvim-comment]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
require("plugin_settings.dap")
time([[Config for nvim-dap]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
require("lsp.saga")
time([[Config for lspsaga.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
require("plugin_settings.galaxyline")
time([[Config for galaxyline.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
require("plugin_settings.dashboard")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("nvim-autopairs").setup()
time([[Config for nvim-autopairs]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require("plugin_settings.gitsigns")
time([[Config for gitsigns.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'mkdx', 'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'mkdx', 'markdown-preview.nvim'}, { ft = "md" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/houlong/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/houlong/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/houlong/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
