DOC := proyecto.tex

all: doc

doc: $(DOC:.tex=.pdf)

all: proyecto.pdf

%.pdf: %.tex
	pdflatex $< && bibtex $* && pdflatex $< && pdflatex $<

ortografia: 
	find . -name "*.tex" -exec hunspell -d es_ES,en_US,en_GB -p diccionario.dic -t -i utf-8 '{}' \;

lista-ortografia:
	find . -name "*.tex" -exec hunspell -d es_ES,en_US,en_GB -p diccionario.dic -L -t -i utf-8 '{}' \;

clean: 
	rm -r *.aux *.lof *.log *.lot *.fls *.out *.toc *.fmt *.fot *.cb *.cb2 .*.lb *.bbl *.blg proyecto.pdf

