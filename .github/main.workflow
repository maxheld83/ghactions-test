workflow "Fix Documentation" {
  on = "push"
  resolves = [
    "Document Package",
    "remote",
    "status"
  ]
}

action "Install Dependencies" {
  uses = "r-lib/ghactions/actions/install-deps@56685442678626eabaaf99b711ff2c505128f4e1"
  needs = "remote"
  runs = "echo foo"
}

action "remote" {
  uses = "r-lib/ghactions/actions/document@56685442678626eabaaf99b711ff2c505128f4e1"
  runs = "ls -a /"
}

action "status" {
  uses = "r-lib/ghactions/actions/document@56685442678626eabaaf99b711ff2c505128f4e1"
  runs = "ls -a /github/home"
}

action "Document Package" {
  uses = "r-lib/ghactions/actions/document@51862fb28a3812291c7cf100a49fbf6dec10795b"
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
