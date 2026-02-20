all: one-page-cv.pdf multi-page-cv.pdf

one-page-cv.pdf: one-page-cv.tex
	latexmk -pdf one-page-cv.tex

multi-page-cv.pdf: multi-page-cv.tex
	latexmk -pdf multi-page-cv.tex

clean:
	rm -f *.aux *.bbl *.bcf *.fdb_latexmk *.fls *.log *.out *.run.xml *.blg *.toc *~

distclean: clean
	rm -f one-page-cv.pdf multi-page-cv.pdf
