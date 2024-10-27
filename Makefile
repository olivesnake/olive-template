# Detect OS
ifeq ($(OS),Windows_NT)
	PYTHON := python
	VENV_DIR := venv/Scripts
	VENV_ACTIVATE := $(VENV_DIR)/activate.bat
	RM := rmdir /s /q
else
	PYTHON := python3
	VENV_DIR := venv/bin
	VENV_ACTIVATE := $(VENV_DIR)/activate
	RM := rm -rf
endif

# Default target
.PHONY: all
all: venv deps

# Create virtual environment
venv: requirements.txt
	$(PYTHON) -m venv venv
	@echo "Virtual environment created."

# Install dependencies
.PHONY: deps
deps: pip-deps node-deps

# Install Python dependencies
.PHONY: pip-deps
pip-deps: venv
ifeq ($(OS),Windows_NT)
	@echo "Installing Python dependencies..."
	@cmd /c "$(VENV_ACTIVATE) && pip install -r requirements.txt"
else
	@echo "Installing Python dependencies..."
	@. $(VENV_ACTIVATE) && pip install -r requirements.txt
endif

# Install Node.js dependencies
.PHONY: node-deps
node-deps:
	@echo "Installing Node.js dependencies..."
	npm install

# Clean up
.PHONY: clean
clean:
	@echo "Cleaning up..."
	-$(RM) venv
	-$(RM) node_modules