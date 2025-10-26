PAPER = main 
TEX = $(wildcard *.tex)

.PHONY: all clean

all: $(PAPER).pdf

$(PAPER).pdf: $(TEX) 
	latexmk -pdf -f -pdflatex='pdflatex --enable-write18 %O %S' $(PAPER).tex

clean:
	rm -rf *.lof *.lot *.toc *.aux *.bbl *.blg *.log *.fdb_latexmk *.fls *.out *.pdf

