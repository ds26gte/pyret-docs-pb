export MAKE_DIR = $(CURDIR)

all:
	make clean
	make once
	make once
	make once

once:
	find . -name compiled -type d -exec rm -fr {} \; || true
	make pollenboots
	echo $(MAKE_DIR)
	raco pollen render index.ptree

pollenboots:
	git clone https://github.com/ds26gte/pollenboots
	cp -p pollenboots/*.{css,js,rkt} .
	cp -p pollenboots/template* .

clean:
	find . -name compiled -type d -exec rm -fr {} \; || true
	find . -name \*.html -delete || true
	make cleanglob

cleanglob:
	rm -f globals.rkt _glossary.rkt
