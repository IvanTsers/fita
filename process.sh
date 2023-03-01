#!/bin/bash

# Weave
bash org2nw.sed fita.org | noweave -n -x | sed 's/^!//;s/@<</<</' > fita.tex
latex fitaDoc
bibtex fitaDoc
latex fitaDoc
latex fitaDoc
dvipdf fitaDoc

# Tangle
grep -v '^$' fita.org | bash org2nw.sed | notangle -Rfita.go | gofmt > fita.go

# Clean
rm -f fita\.tex *\.blg *\.aux *\.bbl *\.dvi
