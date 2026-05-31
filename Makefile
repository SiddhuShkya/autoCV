all: output/cv.pdf

output/cv.pdf: src/cv.tex
	./scripts/compile.sh src/cv.tex

clean:
	rm -f build/*.aux build/*.bbl build/*.bcf build/*.blg build/*.fdb_latexmk \
	       build/*.fls build/*.log build/*.out build/*.run.xml build/*.synctex.gz \
	       build/*.bbl-SAVE-ERROR

distclean: clean
	rm -f output/cv.pdf
