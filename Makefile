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
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/a_3dmodeling.md -o pdf/3dmodeling.pdf

bricksbots:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/m_bricksbots.md" -o "pdf/bricksbots.pdf"

buildbot:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/b_buildbot.md" -o "pdf/buildbot.pdf"

cirqoid:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/l_cirqoid.md -o pdf/cirqoid.pdf

dancebot:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/o_dancebot.md -o pdf/dancebot.pdf

drones:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/g_drones.md" -o pdf/drones.pdf

firmata:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/e_firmata.md -o pdf/firmata.pdf

hens:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/j_hens.md -o pdf/hens.pdf
	
home:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/h_home.md" -o "pdf/home.pdf"

lights:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/n_lights.md" -o "pdf/lights.pdf"

lilypad:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/i_lilypad.md" -o "pdf/lilypad.pdf"

pythonruby:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/c_pythonruby.md -o pdf/pythonruby.pdf	

soldering:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/d_soldering.md -o pdf/soldering.pdf		
	
bricks:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/m_bricksbots.md" -o "pdf/bricksbots.pdf"

thermostat:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/k_thermostat.md" -o "pdf/thermostat.pdf"

underwater:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/f_underwater.md" -o "pdf/underwater.pdf"
	
javarobots:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/p_javarobots.md" -o "pdf/javarobots.pdf"

clean:
	rm -f pdf/$(BOOK_FILE_NAME).pdf