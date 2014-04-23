SOURCE_FILE_NAME = content/workshops/*.md
SOURCE_DIR = content/workshops/

BUILD_PDF_DIR = build/pdf
BUILD_PRINT_DIR = build/print

BOOK_FILE_NAME = makerland

PDF_BUILDER = pandoc
PDF_BUILDER_FLAGS = \
	--latex-engine xelatex \
	--template templates/print.tex \
	--toc

NOTOC_PDF_BUILDER_FLAGS = \
	--latex-engine xelatex \
	--template templates/print_notoc.tex

DIGITAL_PDF_BUILDER_FLAGS = \
	--latex-engine xelatex \
	--template templates/pdf.tex \
	--toc

makerland_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_FILE_NAME) -o $(BUILD_PRINT_DIR)/$(BOOK_FILE_NAME).pdf

makerland_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_FILE_NAME) -o $(BUILD_PDF_DIR)/$(BOOK_FILE_NAME).pdf

intro:
	$(PDF_BUILDER) $(NOTOC_PDF_BUILDER_FLAGS) introduction.md -o $(BUILD_PDF_DIR)/introduction.pdf

3dmodeling_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)a_3dmodeling.md -o $(BUILD_PRINT_DIR)/3dmodeling.pdf

3dmodeling_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)a_3dmodeling.md -o $(BUILD_PDF_DIR)/3dmodeling.pdf

buildbot_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)b_buildbot.md -o $(BUILD_PRINT_DIR)/buildbot.pdf

buildbot_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)b_buildbot.md -o $(BUILD_PDF_DIR)/buildbot.pdf

drones_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)g_drones.md -o $(BUILD_PRINT_DIR)/drones.pdf

drones_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)g_drones.md -o $(BUILD_PDF_DIR)/drones.pdf

firmata_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)e_firmata.md -o $(BUILD_PRINT_DIR)/firmata.pdf

firmata_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)e_firmata.md -o $(BUILD_PDF_DIR)/firmata.pdf

hens_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)j_hens.md -o $(BUILD_PRINT_DIR)/hens.pdf

hens_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)j_hens.md -o $(BUILD_PDF_DIR)/hens.pdf
	
home_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)h_home.md -o $(BUILD_PRINT_DIR)/home.pdf

home_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)h_home.md -o $(BUILD_PDF_DIR)/home.pdf

lights_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)n_lights.md -o $(BUILD_PRINT_DIR)/lights.pdf

lights_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)n_lights.md -o $(BUILD_PDF_DIR)/lights.pdf

lilypad_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)i_lilypad.md -o $(BUILD_PRINT_DIR)/lilypad.pdf

lilypad_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)i_lilypad.md -o $(BUILD_PDF_DIR)/lilypad.pdf

pythonruby_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)c_pythonruby.md -o $(BUILD_PRINT_DIR)/pythonruby.pdf	

pythonruby_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)c_pythonruby.md -o $(BUILD_PDF_DIR)/pythonruby.pdf

soldering_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)d_soldering.md -o $(BUILD_PRINT_DIR)/soldering.pdf	

soldering_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)d_soldering.md -o $(BUILD_PDF_DIR)/soldering.pdf

underwater_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)f_underwater.md -o $(BUILD_PRINT_DIR)/underwater.pdf

underwater_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)f_underwater.md -o $(BUILD_PDF_DIR)/underwater.pdf
	
javarobots_print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)p_javarobots.md -o $(BUILD_PRINT_DIR)/javarobots.pdf

javarobots_pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)p_javarobots.md -o $(BUILD_PDF_DIR)/javarobots.pdf

clean:
	rm -f_pdf/$(BOOK_FILE_NAME).pdf