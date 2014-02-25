SOURCE_FILE_NAME = workshops/*.md
BOOK_FILE_NAME = makerland

PDF_BUILDER = pandoc
PDF_BUILDER_FLAGS = \
	--latex-engine xelatex \
	--template template.tex \
	--toc

makerland.pdf:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_FILE_NAME) -o pdf/$(BOOK_FILE_NAME).pdf

3dmodeling:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/3dmodeling.md -o pdf/3dmodeling.pdf

bricksbots:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/bricksbots.md" -o "pdf/bricksbots.pdf"

buildbot:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/buildbot.md" -o "pdf/buildbot.pdf"

cirqoid:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/cirqoid.md -o pdf/cirqoid.pdf

dancebot:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/dancebot.md -o pdf/dancebot.pdf

drones:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/drones.md" -o pdf/drones.pdf

firmata:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/firmata.md -o pdf/firmata.pdf

hens:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/hens.md -o pdf/hens.pdf
	
home:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/home.md" -o "pdf/home.pdf"

lights:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/lights.md" -o "pdf/lights.pdf"

lilypad:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/lilypad.md" -o "pdf/lilypad.pdf"

pythonruby:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/pythonruby.md -o pdf/pythonruby.pdf	

soldering:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/soldering.md -o pdf/soldering.pdf		
	
bricks:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/bricksbots.md" -o "pdf/bricksbots.pdf"

thermostat:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/thermostat.md" -o "pdf/thermostat.pdf"

underwater:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/underwater.md" -o "pdf/underwater.pdf"
	
javarobots:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/javarobots.md" -o "pdf/javarobots.pdf"

clean:
	rm -f pdf/$(BOOK_FILE_NAME).pdf