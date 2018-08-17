title = main

chapters = Chapters/*.tex
#bibliography = bibliography.bib
config = Config/*.tex
fbMatter = Front-Back_Matter/*.tex
Im = Images/*
ImL = /home/erik/Bureau/Github/Mathone/Images*.eps

all: $(title).tex

clean:
	rm -f *.toc *.aux *.out *.log *.dvi *.bbl *.xml *gz *blg *blx* *fdb* *.fls *.glg *.glo *.gls *.glsdefs *.ist *.lof *.lol *.lot *.nlg *.nlg *.nls *.sbl *converted-to* *.nlo
 

$(title).pdf: $(title).tex
	pdflatex $(title).tex

$(title).tex: $(chapters) $(bibliography) $(fbMatter) $(config) $(Im) $(ImL)
	touch $(title).tex


full:
	pdflatex $(title).tex
	makeindex -s nomentbl.ist -t "$(title).nlg" -o "$(title).nls" "$(title).nlo"
	#for i in $(ImgCreator); do \
	#	matlab -nodisplay -nodesktop -nosplash -r "$$i"; \
	#	done	
	bibtex $(title).aux
	bibtex main1-blx.aux
	pdflatex $(title).tex
	pdflatex $(title).tex
	
foo :
	for i in $(chapters); do \
		echo $$i ; \
		done


