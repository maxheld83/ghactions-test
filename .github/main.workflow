workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@b86caa1a47b229292fbaeacc8de000c41b8322b3"
  runs = "Rscript -e 'Sys.getenv(`R_LIBS_WORKFLOW`)'"
}

action "Document Package" {
  uses = "r-lib/ghactions/actions/document@b86caa1a47b229292fbaeacc8de000c41b8322b3"
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
