all: output/SIDDHARTHA_SHAKYA_ATS_CV.pdf output/SIDDHARTHA_SHAKYA_CL.pdf output/SIDDHARTHA_SHAKYA_CV.pdf

output/SIDDHARTHA_SHAKYA_ATS_CV.pdf: src/ats_cv.tex
	./scripts/compile.sh src/ats_cv.tex SIDDHARTHA_SHAKYA_ATS_CV.pdf

output/SIDDHARTHA_SHAKYA_CL.pdf: src/cl.tex
	./scripts/compile.sh src/cl.tex SIDDHARTHA_SHAKYA_CL.pdf

output/SIDDHARTHA_SHAKYA_CV.pdf: src/cv.tex
	./scripts/compile.sh src/cv.tex SIDDHARTHA_SHAKYA_CV.pdf

clean:
	rm -f build/*.aux build/*.bbl build/*.bcf build/*.blg build/*.fdb_latexmk \
	       build/*.fls build/*.log build/*.out build/*.run.xml build/*.synctex.gz \
	       build/*.bbl-SAVE-ERROR

distclean: clean
	rm -f output/SIDDHARTHA_SHAKYA_ATS_CV.pdf output/SIDDHARTHA_SHAKYA_CL.pdf output/SIDDHARTHA_SHAKYA_CV.pdf