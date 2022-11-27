# package data
VERSION_MAJOR ?= 3
VERSION_MINOR ?= 0
VERSION_MICRO ?= 0
VERSION ?= $(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_MICRO)
PACKAGE_NAME ?= neutrino-webif
PRETTY_PACKAGE_NAME ?= Neutrino-Webinterface
PACKAGE_DATE ?= $(shell date)

# install environment
WEBIF_INSTALL_PREFIX ?=

# neutrino webif configure variables
WEBIF_CONFIG_PREFIX ?=

CONFIGDIR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/config
ZAPITDIR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/config/zapit
DATADIR ?= $(WEBIF_CONFIG_PREFIX)/share/tuxbox
DATADIR_VAR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox
CONTROLDIR ?= $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/control
CONTROLDIR_VAR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/control
FONTDIR ?= $(WEBIF_CONFIG_PREFIX)/share/fonts
FONTDIR_VAR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/fonts
LIBDIR ?= $(WEBIF_CONFIG_PREFIX)/lib/tuxbox
GAMESDIR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/games
ICONSDIR_VAR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/icons
LOCALEDIR ?= $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/locale
LOCALEDIR_VAR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/locale
PLUGINDIR_VAR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/plugins
LUAPLUGINDIR ?= $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/luaplugins
LUAPLUGINDIR_VAR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/luaplugins
THEMESDIR ?= $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/themes
THEMESDIR_VAR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/themes
WEBRADIODIR ?= $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/webradio
WEBRADIODIR_VAR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/webradio
LOGODIR ?= $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/icons/logo
LOGODIR_VAR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/icons/logo
LCD4L_ICONSDIR ?= $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/lcd/icons
LCD4L_ICONSDIR_VAR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/lcd/icons

FLAGDIR ?= $(WEBIF_CONFIG_PREFIX)/var/etc

# httpd config install paths
WEBIF_HTTPD_DIR = /share/tuxbox/neutrino/httpd
PRIVATE_HTTPDDIR ?= $(WEBIF_CONFIG_PREFIX)${WEBIF_HTTPD_DIR}
PUBLIC_HTTPDDIR ?= $(WEBIF_CONFIG_PREFIX)/var/tuxbox/httpd
HOSTED_HTTPDDIR ?= $(WEBIF_CONFIG_PREFIX)/mnt/hosted

# webif target install path
WEBIF_INSTALL_DIR ?= $(WEBIF_INSTALL_PREFIX)${WEBIF_HTTPD_DIR}

install:
	install -d $(WEBIF_INSTALL_DIR); \
	cp -r data/y-web/* $(WEBIF_INSTALL_DIR)/; \
	find $(WEBIF_INSTALL_DIR)/ -type f -print0 | xargs --no-run-if-empty -0 \
		sed -i \
			-e 's|%(CONFIGDIR)|$(CONFIGDIR)|g' \
			-e 's|%(ZAPITDIR)|$(ZAPITDIR)|g' \
			-e 's|%(DATADIR)|$(DATADIR)|g' \
			-e 's|%(DATADIR_VAR)|$(DATADIR_VAR)|g' \
			-e 's|%(CONTROLDIR)|$(CONTROLDIR)|g' \
			-e 's|%(CONTROLDIR_VAR)|$(CONTROLDIR_VAR)|g' \
			-e 's|%(FONTDIR)|$(FONTDIR)|g' \
			-e 's|%(FONTDIR_VAR)|$(FONTDIR_VAR)|g' \
			-e 's|%(LIBDIR)|$(LIBDIR)|g' \
			-e 's|%(GAMESDIR)|$(GAMESDIR)|g' \
			-e 's|%(ICONSDIR_VAR)|$(ICONSDIR_VAR)|g' \
			-e 's|%(LOCALEDIR)|$(LOCALEDIR)|g' \
			-e 's|%(LOCALEDIR_VAR)|$(LOCALEDIR_VAR)|g' \
			-e 's|%(PLUGINDIR_VAR)|$(PLUGINDIR_VAR)|g' \
			-e 's|%(LUAPLUGINDIR)|$(LUAPLUGINDIR)|g' \
			-e 's|%(LUAPLUGINDIR_VAR)|$(LUAPLUGINDIR_VAR)|g' \
			-e 's|%(THEMESDIR)|$(THEMESDIR)|g' \
			-e 's|%(THEMESDIR_VAR)|$(THEMESDIR_VAR)|g' \
			-e 's|%(WEBRADIODIR)|$(WEBRADIODIR)|g' \
			-e 's|%(WEBRADIODIR_VAR)|$(WEBRADIODIR_VAR)|g' \
			-e 's|%(LOGODIR)|$(LOGODIR)|g' \
			-e 's|%(LOGODIR_VAR)|$(LOGODIR_VAR)|g' \
			-e 's|%(LCD4L_ICONSDIR)|$(LCD4L_ICONSDIR)|g' \
			-e 's|%(LCD4L_ICONSDIR_VAR)|$(LCD4L_ICONSDIR_VAR)|g' \
			-e 's|%(PRIVATE_HTTPDDIR)|$(PRIVATE_HTTPDDIR)|g' \
			-e 's|%(PUBLIC_HTTPDDIR)|$(PUBLIC_HTTPDDIR)|g' \
			-e 's|%(HOSTED_HTTPDDIR)|$(HOSTED_HTTPDDIR)|g' \
			-e 's|%(FLAGDIR)|$(FLAGDIR)|g' \
			\
			-e 's|@WEBIF_VERSION@|$(VERSION)|g' \
			-e 's|@WEBIF_PACKAGE_NAME@|$(PACKAGE_NAME)|g' \
			-e 's|@WEBIF_PACKAGE_DATE@|$(PACKAGE_DATE)|g' \
			-e 's|@WEBIF_PRETTY_PACKAGE_NAME@|$(PRETTY_PACKAGE_NAME)|g';

clean:
	rm -rfv $(WEBIF_INSTALL_PREFIX)$(PRIVATE_HTTPDDIR)
