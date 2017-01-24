.PHONY: default isvirtualenv

default:
	@echo "Commands"
	@echo "    make prepare        # Prepares the data."

isvirtualenv:
	@if [ -z "$(VIRTUAL_ENV)" ]; then echo "ERROR: Not in a virtualenv." 1>&2; exit 1; fi

prepare: isvirtualenv
	python clean_data.py

fast: isvirtualenv
	python train_fasttext.py

torch: isvirtualenv
	python train_pytorch.py

install: isvirtualenv
	pip install -r requirements.txt
