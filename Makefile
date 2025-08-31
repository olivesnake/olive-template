ifeq ($(OS), Windows_NT)
	VENV = .venv/Scripts/
else
	VENV = .venv/bin/
endif

PIP = $(VENV)/python -m pip


build: install init

install:
	python3 -m venv .venv/
	$(PIP) install -r requirements.txt

init:
	. $(VENV)/activate
	export FLASK_APP=app
	flask db init
	flask db migrate -m "initial migration"
	flask db upgrade

run:
	python run.py

migrate:
	flask db migrate -m "new migration"

reset:
	rm -rf .venv/
	rm -rf migrations/
	rm instance/*.db