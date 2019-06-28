workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@51f98ea82d8c81a8cf2ff45f6021e0b72d1229f1"
}


action "Document Package" {
  uses = "r-lib/ghactions/actions/document@51f98ea82d8c81a8cf2ff45f6021e0b72d1229f1"
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
