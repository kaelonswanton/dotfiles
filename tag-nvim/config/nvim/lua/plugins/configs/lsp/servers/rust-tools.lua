return {
  settings = {
    ["rust-analyzer"] = {
      diagnostic = {
        refreshSupport = false,
      },
      checkOnSave = {
        command = "clippy",
        extraArgs = { "-W", "clippy::pedantic" }
      }
    },
  },
}
