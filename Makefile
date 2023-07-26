#!/usr/bin/bash

.ONESHELL:

.PHONY: all
all: readme doc test cleanup

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
	@rm -fv ./*.{aux,log,toc,idx,hd,out} ./*~

.PHONY: ctan
ctan: readme
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


QURANDATE := $(shell grep "qurandate{" tex/quran.sty | cut -d'{' -f2 | tr -d '}')
QURANVERSION := $(shell grep "quranversion{" tex/quran.sty | cut -d'{' -f2 | tr -d '}')
YEAR := $(shell date +%Y)
readme-file := README

.PHONY: readme
readme:
	@echo "_____________________" > "${readme-file}"
	@echo "The quran package" >> "${readme-file}"
	@echo "v${QURANVERSION}" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "The package is prepared for typesetting the holy Quran." >> "${readme-file}"
	@echo "This work provides several macros for typesetting the whole or" >> "${readme-file}"
	@echo "any parts of the holy Quran based on its popular divisions." >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "For more information, please see the documentation." >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Current version release date: ${QURANDATE}" >> "${readme-file}"
	@echo "___________________" >> "${readme-file}"
	@echo "Seiied-Mohammad-Javad Razvian" >> "${readme-file}"
	@echo "javadr@gmail.com" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Copyright © 2015-${YEAR}" >> "${readme-file}"
	@echo "It may be distributed and/or modified under the LaTeX Project Public License," >> "${readme-file}"
	@echo "version 1.3c or higher \"(your choice)\". The latest version of" >> "${readme-file}"
	@echo "this license is at: http://www.latex-project.org/lppl.txt" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "This work is “author-maintained” (as per LPPL maintenance status)" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "by Seiied-Mohammad-Javad Razavian." >> "${readme-file}"
