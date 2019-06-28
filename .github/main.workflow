workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@ee136a3b5abfac94c484de9bef2a1704605a58ee"
}


action "Document Package" {
  uses = "r-lib/ghactions/actions/document@ee136a3b5abfac94c484de9bef2a1704605a58ee"
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
