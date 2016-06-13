.PHONY: help clean html epub deploy

DOC_DIR=doc
GIT=/usr/local/bin/git
GIT_USER_NAME=Nikolaas N. Oosterhof
GIT_USER_EMAIL=n.n.oosterhof@googlemail.com
REPO=$(shell $(GIT) config remote.origin.url)

	
help:
	@echo "Usage: make <clean|html|epub|deploy"

clean html epub:
	@make -C $(DOC_DIR) $@

deploy: 
	echo $(REPO)
	cd doc/build/html; \
	git config user.name $(GIT_USER_NAME); \
	git config user.email $(GIT_USER_EMAIL); \
	git init; \
	git checkout --orphan gh-pages; \
	git add . ; \
	git commit -m "gh-pages deployment"
	openssl aes-256-cbc -K $(encrypted_946d2a4c8154_key) -iv $(encrypted_946d2a4c8154_iv) -in ../../deploy-key.enc -out ./deploy-key
	git push 

	

	