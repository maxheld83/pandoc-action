workflow "Test pandoc" {
  on = "push"
  resolves = ["Deploy"]
}

action "Write sha" {
  uses = "actions/bin/sh@db72a46c8ce298e5d2c3a51861e20c455581524f"
  args = ["echo '*latest commit is* ' $GITHUB_SHA 'on ' $GITHUB_REF >> index.md"]
}

action "Convert" {
  uses = "./"
  needs = "Write sha"
  env = {
    OUT_DIR = "public"
  }
  args = [
    "--standalone",
    "--output=public/index.html",
    "index.md"
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
