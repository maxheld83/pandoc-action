workflow "Test pandoc" {
  on = "push"
  resolves = ["Convert", "Deploy"]
}

action "Convert" {
  uses = "./"
  env = {
    OUT_DIR = "public"
  }
  args = [
    "--standalone",
    "--output=public/index.html",
    "README.md"
  ]
}

action "Deploy" {
  uses = "maxheld83/ghpages@v0.2.1"
  needs = "Convert"
  env = {
    BUILD_DIR = "public"
  }
  secrets = ["GH_PAT"]
}
