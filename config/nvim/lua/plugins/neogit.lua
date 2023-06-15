local neogit = require("neogit")

neogit.setup({
  kind = "vsplit",
  disable_context_highlighting = true,
  commit_popup = {
    kind = "split",
  },
  integrations = {
    diffview = true,
  }
})
