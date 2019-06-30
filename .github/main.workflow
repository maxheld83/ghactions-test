workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@56ef306270d3f15a250c4db2880e9309286efd5a"
  runs = "Rscript -e 'Sys.getenv(`R_LIBS_WORKFLOW`)'"
}

action "Document Package" {
  uses = "r-lib/ghactions/actions/document@56ef306270d3f15a250c4db2880e9309286efd5a"
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
