---@type vim.lsp.Config
return {
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  root_markers = { ".git", ".rubocop.yml", "Gemfile" },
  init_options = {
    formatter = "rubocop_internal",
    linters = { "rubocop_internal" },
    experimentalFeaturesEnabled = false,
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
    enabledFeatures = {
      codeActions = false,
      codeLens = false,
      completion = true,
      definition = true,
      diagnostics = true,
      documentHighlights = false,
      documentLink = false,
      documentSymbols = true,
      foldingRanges = false,
      formatting = false,
      hover = true,
      inlayHint = false,
      onTypeFormatting = false,
      selectionRanges = false,
      semanticHighlighting = true,
      signatureHelp = true,
      typeHierarchy = false,
      workspaceSymbol = true,
    },
    featuresConfiguration = {
      inlayHint = {
        implicitHashValue = false,
        implicitRescue = false
      },
    },
    indexing = {
      excludedGems = {
        "bootsnap",
        "pg",
        "sqlite3",
        "stimulus-rails",
        "turbo-rails",
        "tzinfo-data",
        "title",
        "aws-sdk-s3",
        "debug",
        "rubocop-inhouse",
        "launchy",
        "phlex-testing-capybara",
        "shoulda-matchers",
        "brakeman",
        "bundler-audit",
        "database_consistency",
        "dockerfile-rails",
        "letter_opener_web",
        "overcommit",
        "syntax_suggest",
        "web-console",
        "phlex",
        "phlex-rails"
      },
    },
  },
}
