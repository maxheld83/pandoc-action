workflow "Test pandoc" {
  on = "push"
  resolves = ["Convert", "Deploy"]
}

action "Convert" {
  uses = "./"
  args = [
    "--standalone",
    "--output=index.html",
    "README.md"
  ]
}

action "Deploy" {
  uses = "maxheld83/ghpages@v0.2.1"
  needs = "Convert"
  env = {
    BUILD_DIR = "."
  }
  secrets = ["GH_PAT"]
}
