pandoc -s -f markdown+grid_tables -t html5 \
  --toc --toc-depth=3 \
  --number-sections \
  --citeproc --bibliography=references.bib \
  --mathjax \
  --highlight-style=espresso \
  -c http://paperweb.com \
  buildsettings.md -o buildsettings.html
pandoc --filter pandoc-citeproc myinput.txt
