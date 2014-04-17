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

makerland print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_FILE_NAME) -o $(BUILD_PRINT_DIR)/$(BOOK_FILE_NAME).pdf

makerland pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_FILE_NAME) -o $(BUILD_PDF_DIR)/$(BOOK_FILE_NAME).pdf

intro:
	$(PDF_BUILDER) $(NOTOC_PDF_BUILDER_FLAGS) introduction.md -o $(BUILD_PDF_DIR)/introduction.pdf

3dmodeling print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)a_3dmodeling.md -o $(BUILD_PRINT_DIR)/3dmodeling.pdf

3dmodeling pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)a_3dmodeling.md -o $(BUILD_PDF_DIR)/3dmodeling.pdf

buildbot print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)b_buildbot.md -o $(BUILD_PRINT_DIR)/buildbot.pdf

buildbot pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)b_buildbot.md -o $(BUILD_PDF_DIR)/buildbot.pdf

drones print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)g_drones.md -o $(BUILD_PRINT_DIR)/drones.pdf

drones pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)g_drones.md -o $(BUILD_PDF_DIR)/drones.pdf

firmata print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)e_firmata.md -o $(BUILD_PRINT_DIR)/firmata.pdf

firmata pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)e_firmata.md -o $(BUILD_PDF_DIR)/firmata.pdf

hens print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)j_hens.md -o $(BUILD_PRINT_DIR)/hens.pdf

hens pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)j_hens.md -o $(BUILD_PDF_DIR)/hens.pdf
	
home print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)h_home.md -o $(BUILD_PRINT_DIR)/home.pdf

home pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)h_home.md -o $(BUILD_PDF_DIR)/home.pdf

lights print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)n_lights.md -o $(BUILD_PRINT_DIR)/lights.pdf

lights pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)n_lights.md -o $(BUILD_PDF_DIR)/lights.pdf

lilypad print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)i_lilypad.md -o $(BUILD_PRINT_DIR)/lilypad.pdf

lilypad pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)i_lilypad.md -o $(BUILD_PDF_DIR)/lilypad.pdf

pythonruby print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)c_pythonruby.md -o $(BUILD_PRINT_DIR)/pythonruby.pdf	

pythonruby pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)c_pythonruby.md -o $(BUILD_PDF_DIR)/pythonruby.pdf

soldering print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)d_soldering.md -o $(BUILD_PRINT_DIR)/soldering.pdf	

soldering pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)d_soldering.md -o $(BUILD_PDF_DIR)/soldering.pdf

underwater print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)f_underwater.md -o $(BUILD_PRINT_DIR)/underwater.pdf

underwater pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)f_underwater.md -o $(BUILD_PDF_DIR)/underwater.pdf
	
javarobots print:
	$(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_DIR)p_javarobots.md -o $(BUILD_PRINT_DIR)/javarobots.pdf

javarobots pdf:
	$(PDF_BUILDER) $(DIGITAL_PDF_BUILDER_FLAGS) $(SOURCE_DIR)p_javarobots.md -o $(BUILD_PDF_DIR)/javarobots.pdf

clean:
	rm -f pdf/$(BOOK_FILE_NAME).pdf