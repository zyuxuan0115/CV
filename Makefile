PAPER = main
TEX   = $(wildcard *.tex)
STYLE = resume.sty

.PHONY: all clean distclean view xelatex

all: $(PAPER).pdf

$(PAPER).pdf: $(TEX) $(STYLE)
	latexmk -pdf -interaction=nonstopmode -halt-on-error $(PAPER)

xelatex:
	latexmk -xelatex -interaction=nonstopmode -halt-on-error $(PAPER)

view: $(PAPER).pdf
	@open $(PAPER).pdf 2>/dev/null || xdg-open $(PAPER).pdf

clean:
	latexmk -C
	@rm -f *.fls *.fdb_latexmk

distclean: clean
	@rm -f $(PAPER).pdf
