all: output/one-page-cv.pdf output/multi-page-cv.pdf

output/one-page-cv.pdf: src/one-page-cv.tex
	./scripts/compile.sh src/one-page-cv.tex

output/multi-page-cv.pdf: src/multi-page-cv.tex
	./scripts/compile.sh src/multi-page-cv.tex

clean:
	rm -f build/*.aux build/*.bbl build/*.bcf build/*.blg build/*.fdb_latexmk \
	       build/*.fls build/*.log build/*.out build/*.run.xml build/*.synctex.gz \
	       build/*.bbl-SAVE-ERROR

distclean: clean
	rm -f output/one-page-cv.pdf output/multi-page-cv.pdf
