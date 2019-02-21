FROM pandoc/latex:2.6

LABEL "maintainer"="Maximilian Held <info@maxheld.de>"
LABEL "repository"="http://github.com/maxheld83/pandoc"
LABEL "homepage"="http://github.com/maxheld83/pandoc"

LABEL "com.github.actions.name"="Pandoc Document Conversion"
LABEL "com.github.actions.description"="Convert documents with pandoc and LaTeX."
LABEL "com.github.actions.icon"="book-open"
LABEL "com.github.actions.color"="green"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
