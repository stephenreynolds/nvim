return {
  InlayHints = {
    Enabled = true,
    Designators = true,
    ParameterNames = true,
    DeducedTypes = true,
  },
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
