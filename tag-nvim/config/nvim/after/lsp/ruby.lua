---@type vim.lsp.Config
return {
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  root_markers = { ".git", ".rubocop.yml", "Gemfile" },
  init_options = {
    formatter = "rubocop_internal",
    linters = { "rubocop_internal" },
    experimentalFeaturesEnabled = false,
    enabledFeatures = {
      codeActions = true,
      codeLens = true,
      completion = true,
      definition = true,
      diagnostics = true,
      documentHighlights = true,
      documentLink = true,
      documentSymbols = true,
      foldingRanges = true,
      formatting = true,
      hover = true,
      inlayHint = true,
      onTypeFormatting = true,
      selectionRanges = true,
      semanticHighlighting = true,
      signatureHelp = true,
      typeHierarchy = true,
      workspaceSymbol = true,
    },
    featuresConfiguration = {
      inlayHint = {
        implicitHashValue = true,
        implicitRescue = true,
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
      },
    },
  },
}
