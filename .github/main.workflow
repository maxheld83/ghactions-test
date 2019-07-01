workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package",
    "remote",
    "status"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@d8aac3d7d90a9a867fa09b133b982aa32f9255ba"
}

action "remote" {
  uses = "actions/bin/sh@master"
  args = ["git remote -v"]
}

action "status" {
  uses = "actions/bin/sh@master"
  args = ["git status -v"]
}

action "Document Package" {
  uses = "r-lib/ghactions/actions/document@d8aac3d7d90a9a867fa09b133b982aa32f9255ba"
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
