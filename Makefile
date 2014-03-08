SOURCE_FILE_NAME = workshops/*.md
BOOK_FILE_NAME = makerland

PDF_BUILDER = pandoc
PDF_BUILDER_FLAGS = \
	--latex-engine xelatex \
	--template template.tex \
	--toc

NOTOC_PDF_BUILDER_FLAGS = \
	--latex-engine xelatex \
	--template template_notoc.tex

DIGITAL_PDF_BUILDER_FLAGS = \
	--latex-engine xelatex \
	--template digital.tex \
	--toc

makerland.pdf:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_FILE_NAME) -o pdf/$(BOOK_FILE_NAME).pdf

intro:
	$(PDF_BUILDER) $(NOTOC_PDF_BUILDER_FLAGS) introduction.md -o pdf/introduction.pdf

3dmodeling:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/a_3dmodeling.md -o pdf/3dmodeling.pdf

3dmodeling_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) workshops/a_3dmodeling.md -o pdf/digital_3dmodeling.pdf

bricksbots:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/m_bricksbots.md" -o "pdf/bricksbots.pdf"

bricksbots_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/m_bricksbots.md" -o "pdf/digital_bricksbots.pdf"

buildbot:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/b_buildbot.md" -o "pdf/buildbot.pdf"

buildbot_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/b_buildbot.md" -o "pdf/digital_buildbot.pdf"

cirqoid:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/l_cirqoid.md -o pdf/cirqoid.pdf

cirqoid_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/l_cirqoid.md" -o "pdf/digital_cirqoid.pdf"

dancebot:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/o_dancebot.md -o pdf/dancebot.pdf

dancebot_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/o_dancebot.md" -o "pdf/digital_dancebot.pdf"

drones:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/g_drones.md" -o pdf/drones.pdf

drones_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/g_drones.md" -o "pdf/digital_drones.pdf"

firmata:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/e_firmata.md -o pdf/firmata.pdf

firmata_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/e_firmata.md" -o "pdf/digital_firmata.pdf"

hens:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/j_hens.md -o pdf/hens.pdf

hens_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/j_hens.md" -o "pdf/digital_hens.pdf"
	
home:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/h_home.md" -o "pdf/home.pdf"

home_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/h_home.md" -o "pdf/digital_home.pdf"

lights:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/n_lights.md" -o "pdf/lights.pdf"

lights_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/n_lights.md" -o "pdf/digital_lights.pdf"

lilypad:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/i_lilypad.md" -o "pdf/lilypad.pdf"

lilypad_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/i_lilypad.md" -o "pdf/digital_lilypad.pdf"

pythonruby:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/c_pythonruby.md -o pdf/pythonruby.pdf	

pythonruby_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/c_pythonruby.md" -o "pdf/digital_pythonruby.pdf"

soldering:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) workshops/d_soldering.md -o pdf/soldering.pdf	

soldering_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/d_soldering.md" -o "pdf/digital_soldering.pdf"	

thermostat:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/k_thermostat.md" -o "pdf/thermostat.pdf"

thermostat_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/k_thermostat.md" -o "pdf/digital_thermostat.pdf"

underwater:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/f_underwater.md" -o "pdf/underwater.pdf"

underwater_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/f_underwater.md" -o "pdf/digital_underwater.pdf"
	
javarobots:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) "workshops/p_javarobots.md" -o "pdf/javarobots.pdf"

javarobots_digital:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) "workshops/p_javarobots.md" -o "pdf/digital_javarobots.pdf"

clean:
	rm -f pdf/$(BOOK_FILE_NAME).pdf