workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@b5a2fe4a28bac9f3f8357823da43c3272383c7d3"
}

action "Document Package" {
  uses = "r-lib/ghactions/actions/document@b5a2fe4a28bac9f3f8357823da43c3272383c7d3"
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
