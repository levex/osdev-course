TEX=pdflatex
OUTPUT_DIR=bin

SLIDES_TEX=$(wildcard slides/*/*.tex)
SLIDES_TEX += $(wildcard slides/*.tex)
SLIDES_TARGET=$(subst slides,out-slides,$(subst .tex,.pdf,$(SLIDES_TEX)))

all: $(SLIDES_TARGET)

.PHONY: clean

clean:
	-@rm `find -name *.aux` 2>&1 >/dev/null
	-@rm `find -name *.log` 2>&1 >/dev/null
	-@rm `find -name *.nav` 2>&1 >/dev/null
	-@rm `find -name *.out` 2>&1 >/dev/null
	-@rm `find -name *.pdf` 2>&1 >/dev/null
	-@rm `find -name *.snm` 2>&1 >/dev/null
	-@rm `find -name *.toc` 2>&1 >/dev/null

out-slides/%.pdf: slides/%.tex
	@echo "   TEX     $(notdir $@)"
	@$(TEX) -output-directory $(OUTPUT_DIR) $<  >/dev/null
	-@mkdir -p $(dir $@)
	@mv $(OUTPUT_DIR)/$(notdir $@) $@
