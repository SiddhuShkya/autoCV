all: output/cv.pdf output/cl.pdf output/res.pdf

output/cv.pdf: src/cv.tex
	./scripts/compile.sh src/cv.tex

output/cl.pdf: src/cl.tex
	./scripts/compile.sh src/cl.tex

output/res.pdf: src/res.tex
	./scripts/compile.sh src/res.tex

clean:
	rm -f build/*.aux build/*.bbl build/*.bcf build/*.blg build/*.fdb_latexmk \
	       build/*.fls build/*.log build/*.out build/*.run.xml build/*.synctex.gz \
	       build/*.bbl-SAVE-ERROR

distclean: clean
	rm -f output/cv.pdf output/cl.pdf output/res.pdf