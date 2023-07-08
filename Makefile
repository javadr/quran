#!/bin/bash

.PHONY: all
all: doc test cleanup

.ONESHELL:

.PHONY: doc
doc:
	$(MAKE) -C doc
	cd doc || exit
	xelatex quran-doc
	xelatex quran-doc

.PHONY: test
test:
	$(MAKE) -C sample  quran-test.tex quran-test1.tex quran-test2.tex
	cd sample || exit
	xelatex quran-test
	xelatex quran-test1
	xelatex quran-test2
	cd .. || exit

.PHONY: cleanup
cleanup:
	$(MAKE) clean
	$(MAKE) clean -C doc -f ../Makefile
	$(MAKE) clean -C tex -f ../Makefile
	$(MAKE) clean -C sample -f ../Makefile

.PHONY: clean
clean:
	@rm -fv "*.{aux,log,toc,idx,hd,out}" ./*~

.PHONY: ctan
ctan:
	$(MAKE) cleanup
	mkdir -p quran/doc quran/tex
	cp -v README        quran
	cd tex || exit
	cp -v quran.sty qurantext-uthmani.def qurantext-uthmani-min.def qurantext-simple.def      ../quran/tex
	cp -v qurantext-en.transliteration.def quran-translt.def	../quran/tex
	cp -v qurantext-en.translation.def quran-transen.def		../quran/tex
	cp -v qurantext-de.translation.def quran-transde.def		../quran/tex
	cp -v qurantext-fa.translation.def quran-transfa.def		../quran/tex
	cp -v qurantext-fr.translation.def quran-transfr.def		../quran/tex
	cd ../doc/ || exit
	cp -v quran-doc.pdf quran-doc.tex quran.png     ../quran/doc
	cd ../sample || exit
	cp -v quran-test*    ../quran/doc
	cd ..
	zip -r quran.zip quran
	mv -fv quran.zip ..
	rm -rfv ../quran
	mv -fv quran ..
