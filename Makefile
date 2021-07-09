#
#  Author: Hari Sekhon
#  Date: 2020-08-12 12:10:41 +0100 (Wed, 12 Aug 2020)
#
#  vim:ts=4:sts=4:sw=4:noet
#
#  https://github.com/HariSekhon/SQL-keywords
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
#
#  https://www.linkedin.com/in/harisekhon
#

# On Ubuntu this fails to pushd otherwise
# fails to bootstrap on Alpine
#SHELL := /usr/bin/env bash

.PHONY: build
build: init
	@echo "nothing to build"

.PHONY: init
init:
	git submodule update --init --recursive

.PHONY: all
all: build test
	@:

.PHONY: test
test:
	curl -sS https://raw.githubusercontent.com/HariSekhon/DevOps-Bash-tools/master/setup/bootstrap.sh | sh
	bash-tools/check_pytools.sh

.PHONY: push
push:
	git push --all
