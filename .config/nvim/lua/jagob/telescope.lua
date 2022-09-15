require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  -- pickers = {
  --   -- Default configuration for builtin pickers goes here:
  --   -- picker_name = {
  --   --   picker_config_key = value,
  --   --   ...
  --   -- }
  --   -- Now the picker_config_key will be applied every time you call this
  --   -- builtin picker
  -- },
  -- extensions = {
  --   -- Your extension configuration goes here:
  --   -- extension_name = {
  --   --   extension_config_key = value,
  --   -- }
  --   -- please take a look at the readme of the extension you want to configure
  -- }
  -- file_ignore_patterns = {
  --  '.git/', 'node_modules/', '.npm/', '*[Cc]ache/', '*-cache*',
  --  '.dropbox/', '.dropbox_trashed/', '*.py[co]', '*.sw?', '*~',
  --  '*.sql', '*.tags*', '*.gemtags*', '*.csv', '*.tsv', '*.tmp*',
  --  '*.old', '*.plist', '*.pdf', '*.log', '*.jpg', '*.jpeg', '*.png',
  --  '*.tar.gz', '*.tar', '*.zip', '*.class', '*.pdb', '*.dll',
  --  '*.dat', '*.mca', '__pycache__', '.mozilla/', '.electron/',
  --  '.vpython-root/', '.gradle/', '.nuget/', '.cargo/', '.evernote/',
  --  '.azure-functions-core-tools/', 'yay/', '.local/share/Trash/',
  --  '.local/share/nvim/swap/', 'code%-other/'-
  -- extensions = {
  --   fzf = {
  --     fuzzy = true,                    -- false will only do exact matching
  --     override_generic_sorter = true,  -- override the generic sorter
  --     override_file_sorter = true,     -- override the file sorter
  --     case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
  --                                      -- the default case_mode is "smart_case"
  --   }
  --   -- fzy_native = {
  --   --     override_generic_sorter = false,
  --   --     override_file_sorter = true,
  --   -- }
}  

-- require("telescope")
-- require'telescope'.load_extension('fzf')
-- require("telescope").load_extension("fzy_native") 

local M = {}

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< dotfiles >",
        cwd = "~/dotfiles/",
		hidden = true,
	})
end

return M
