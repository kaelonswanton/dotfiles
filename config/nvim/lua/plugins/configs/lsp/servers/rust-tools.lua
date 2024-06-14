return {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
        extraArgs = { "-W", "clippy::pedantic" }
      }
    },
  },
}
