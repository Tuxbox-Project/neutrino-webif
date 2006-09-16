SUBDIRS = images scripts

install-data-local:
	install -d $(DATADIR)/neutrino/httpd-y
	install -m 0644 *.yhtm $(DATADIR)/neutrino/httpd-y
	install -m 0644 *.htm $(DATADIR)/neutrino/httpd-y
	install -m 0644 *.html $(DATADIR)/neutrino/httpd-y
	install -m 0644 *.css $(DATADIR)/neutrino/httpd-y
	install -m 0644 *.js $(DATADIR)/neutrino/httpd-y
	install -m 0644 *.txt $(DATADIR)/neutrino/httpd-y
	install -m 0644 *.ico $(DATADIR)/neutrino/httpd-y

uninstall-local:
	-rm -rf $(DATADIR)/neutrino/httpd-y