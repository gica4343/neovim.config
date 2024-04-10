return {
    'nvim-lualine/lualine.nvim',
   config = function()
      require('lualine').setup({
      options = {
         theme = 'nord',
         { section_separators = '', component_separators = '' }
      }   
      })
   end
    --dependencies = { 'nvim-tree/nvim-web-devicons' }
}
