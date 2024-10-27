OS="$(uname)"

all: setup run

setup:
	python -m venv venv/

	# Activate the virtual environment based on the OS
	if [[ "$OS" == "Linux" || "$OS" == "Darwin" ]]; then
		source venv/bin/activate
	elif [[ "$OS" == CYGWIN* || "$OS" == MINGW* || "$OS" == MSYS* ]]; then
		source venv/Scripts/activate
	else
		echo "Unknown OS: $OS"
		exit 1
	fi
	# Install Python dependencies
	pip install -r requirements.txt

	# Install npm dependencies
	npm install

	echo "Template setup complete!"

run:
	npm run dev