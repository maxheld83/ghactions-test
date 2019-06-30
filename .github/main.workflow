workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@66e2d1931618a56914201b1ea50b01ac7cacb7c0"
  runs = "Rscript -e 'Sys.getenv(`R_LIBS_WORKFLOW`)'"
}

action "Document Package" {
  uses = "r-lib/ghactions/actions/document@66e2d1931618a56914201b1ea50b01ac7cacb7c0"
  needs = [
    "Install Dependencies"
  ]
}
