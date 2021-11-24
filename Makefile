all: doc test clean

doc:
	xelatex quran-doc
	xelatex quran-doc
test: quran-test.tex quran-test1.tex quran-test2.tex
	xelatex quran-test
	xelatex quran-test1
	xelatex quran-test2
clean:
	rm *.aux *.log *.toc *.idx *.hd *~ *.out
ctan: 
#	$(MAKE) clean
	mkdir -p quran/doc quran/tex
	cp -v README        quran
	cp -v quran.sty qurantext-uthmani.def qurantext-uthmani-min.def qurantext-simple.def      quran/tex
	cp -v qurantext-en.transliteration.def quran-translt.def		quran/tex
	cp -v qurantext-en.translation.def quran-transen.def		quran/tex
	cp -v qurantext-de.translation.def quran-transde.def		quran/tex
	cp -v qurantext-fa.translation.def quran-transfa.def		quran/tex
	cp -v qurantext-fr.translation.def quran-transfr.def		quran/tex
	cp -v quran-doc.pdf quran-doc.tex quran.png     quran/doc
	# removed by ver 1.6
	#cp -v defaulttext.tex uthmanitext.tex  defaulttext.pdf uthmanitext.pdf      quran/doc
	cp -v quran-test*    quran/doc
	zip -r quran.zip quran
	mv -fv quran.zip ..
	rm -rfv ../quran
	mv -fv quran ..
