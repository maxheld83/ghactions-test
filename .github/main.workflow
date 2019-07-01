workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@23e7d1306de7b1688ba6a72a89aeed1f049e9d2a"
  runs = "Rscript -e 'Sys.getenv(`R_LIBS_WORKFLOW`)'"
}

action "Document Package" {
  uses = "r-lib/ghactions/actions/document@23e7d1306de7b1688ba6a72a89aeed1f049e9d2a"
  needs = [
    "Install Dependencies"
  ]
  args = [
    "--after-code=commit"
  ]
  secrets = [
    "GITHUB_TOKEN"
  ]
}
