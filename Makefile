SHELL := /usr/local/bin/bash

default:
	ls *.docx | while read doc; do \
		name="$${doc:1:-5}"; \
		gallery=$$(gsed -e 's/-1//; s/[^0-9]//g; s/^0//' <<<$$doc); \
		echo $$gallery; \
		textutil -convert html $$doc -stdout \
		| pandoc -r html -w markdown_github \
		> $$gallery.md; \
	done;
