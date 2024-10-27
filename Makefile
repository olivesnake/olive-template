OS := $(shell uname)

all: setup run

setup:
	python3 -m venv venv
ifeq ($(OS), Linux)
	. venv/bin/activate
else ifeq ($(OS), Darwin)
	. venv/bin/activate
else ifneq (,$(findstring CYGWIN,$(OS)))
	. venv/Scripts/activate
else ifneq (,$(findstring MINGW,$(OS)))
	. venv/Scripts/activate
else ifneq (,$(findstring MSYS,$(OS)))
	. venv/Scripts/activate
else
	@echo "Unknown OS: $(OS)"
	@exit 1
endif
	venv/bin/pip install -r requirements.txt
	npm install

	@echo "Template setup complete!"

run:
	npm run dev