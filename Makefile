### Makefile for GN.md
### Gerhard Nachtmann 20160224 based on former work

FILE = GN
AUX = $(FILE).docx $(FILE).html $(FILE).pdf

.PHONY:		all clean pdf html word
.SILENT:	pdf html word

all:		pdf html word

pdf:		$(FILE).pdf

$(FILE).pdf:	*.Rmd
		Rscript -e "rmarkdown::render('$(FILE).Rmd', 'pdf_document')"

html:		$(FILE).html

$(FILE).html:	*.Rmd
		Rscript -e "rmarkdown::render('$(FILE).Rmd', 'html_document')"

word:		$(FILE).docx

$(FILE).docx:	*.Rmd
		Rscript -e "rmarkdown::render('$(FILE).Rmd', 'word_document')"

clean:
		rm $(AUX)



