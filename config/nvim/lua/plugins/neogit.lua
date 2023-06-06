local neogit = require("neogit")

neogit.setup({
  kind = "split",
  disable_context_highlighting = true,
  commit_popup = {
    kind = "floating",
  },
  integrations = {
    diffview = true,
  }
})
