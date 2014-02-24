SOURCE_FILE_NAME = workshops/*.md
BOOK_FILE_NAME = makerland

PDF_BUILDER = pandoc
PDF_BUILDER_FLAGS = \
	--latex-engine xelatex \
	--template template.tex \
	--toc

makerland.pdf:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_FILE_NAME) -o $(BOOK_FILE_NAME).pdf

3dmodeling:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/3dmodeling.md -o 3dmodeling.pdf

bricksbots:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/bricksbots.md" -o "bricksbots.pdf"

buildbot:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/buildbot.md" -o "buildbot.pdf"

cirqoid:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/cirqoid.md -o cirqoid.pdf

dancebot:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/dancebot.md -o dancebot.pdf

drones:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/drones.md" -o drones.pdf

firmata:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/firmata.md -o firmata.pdf

hens:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/hens.md -o hens.pdf
	
home:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/home.md" -o "home.pdf"

lights:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/lights.md" -o "lights.pdf"

lilypad:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/lilypad.md" -o "lilypad.pdf"

pythonruby:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/pythonruby.md -o pythonruby.pdf	

soldering:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/soldering.md -o soldering.pdf		
	
bricks:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/bricksbots.md" -o "bricksbots.pdf"

thermostat:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/thermostat.md" -o "thermostat.pdf"

underwater:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/underwater.md" -o "underwater.pdf"
	
javarobots:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/javarobots.md" -o "javarobots.pdf"

clean:
	rm -f $(BOOK_FILE_NAME).pdf