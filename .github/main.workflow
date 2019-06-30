workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@478aaec0c9b1daf13480b0daa8f966a8423130e0"
  runs = "Rscript -e 'Sys.getenv(`R_LIBS_WORKFLOW`)'"
}

action "Document Package" {
  uses = "r-lib/ghactions/actions/document@478aaec0c9b1daf13480b0daa8f966a8423130e0"
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
