INSTALL_DIR ?= "$(HOME)/nhttpd"

install:
	install -d $(INSTALL_DIR)
	cp -r data/y-web/* $(INSTALL_DIR)/

clean:
	rm -rfv $(INSTALL_DIR)
