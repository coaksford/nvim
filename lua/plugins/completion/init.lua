-- modified from example at https://cmp.saghen.dev/installation
return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*', -- use a release tag to download pre-built binaries
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts_extend = { "sources.default" }
}
