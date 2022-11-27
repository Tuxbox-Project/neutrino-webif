
# Installation #

## Preparing ##
It's a good idea to disable y-web within the Neutrino build environment
to avoid overlaps. Please use the option within neutrino build configure:
```bash
	--without-webif
```

## Clone from Github ##
```bash
	git clone https://github.com/Tuxbox-Project/neutrino-webif.git
	cd neutrino-webif
```

## Set install environment ##
For customized installation please modify the required environment and
use the WEBIF_INSTALL_PREFIX variable to set the root installation path.

Default value is empty and points to root:
```bash
	WEBIF_INSTALL_PREFIX=
```

Set the WEBIF_INSTALL_PREFIX path which is provided by your build environment.
E.g. on generic platform, root access is required, therefore it's almost certainly necessary
to customize this path. Default value is empty.
```bash
	export WEBIF_INSTALL_PREFIX=<path>
```

## Set config environment ##
If required, use the WEBIF_CONFIG_PREFIX variable to set the paths of directory 
configurations inside the files of webif directories. 
While the installation of webif this prefix will be prefixed ahead of the predefined 
paths and will replace together the defined placeholders.

Default value is empty and in most cases this value should be untouched.
```bash
	export WEBIF_CONFIG_PREFIX=
```

## Customize environment ##
You can customize more paths and configuration variables, for default values see following lines:

```bash
	CONFIGDIR 		 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/config
	ZAPITDIR 		 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/config/zapit
	DATADIR 		 $(WEBIF_CONFIG_PREFIX)/share/tuxbox
	DATADIR_VAR 		 $(WEBIF_CONFIG_PREFIX)/var/tuxbox
	CONTROLDIR 		 $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/control
	CONTROLDIR_VAR 		 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/control
	FONTDIR 		 $(WEBIF_CONFIG_PREFIX)/share/fonts
	FONTDIR_VAR 		 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/fonts
	LIBDIR 		 	 $(WEBIF_CONFIG_PREFIX)/lib/tuxbox
	GAMESDIR 		 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/games
	ICONSDIR_VAR 		 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/icons
	LOCALEDIR 		 $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/locale
	LOCALEDIR_VAR 		 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/locale
	PLUGINDIR_VAR 		 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/plugins
	LUAPLUGINDIR 		 $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/luaplugins
	LUAPLUGINDIR_VAR 	 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/luaplugins
	THEMESDIR 		 $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/themes
	THEMESDIR_VAR 		 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/themes
	WEBRADIODIR 		 $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/webradio
	WEBRADIODIR_VAR 	 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/webradio
	LOGODIR 		 $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/icons/logo
	LOGODIR_VAR 		 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/icons/logo
	LCD4L_ICONSDIR 		 $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/lcd/icons
	LCD4L_ICONSDIR_VAR 	 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/lcd/icons
	PRIVATE_HTTPDDIR 	 $(WEBIF_CONFIG_PREFIX)/share/tuxbox/neutrino/httpd
	PUBLIC_HTTPDDIR 	 $(WEBIF_CONFIG_PREFIX)/var/tuxbox/httpd
	HOSTED_HTTPDDIR 	 $(WEBIF_CONFIG_PREFIX)/mnt/hosted
	FLAGDIR 		 $(WEBIF_CONFIG_PREFIX)/var/etc
```

## Customize environment variables for version info ##
These variables are predefined within Makefile and can be overwritten with the export instruction.

```bash
	VERSION
	PACKAGE_NAME
	PRETTY_PACKAGE_NAME
	PACKAGE_DATE
```

# Install #
```bash
	make install
```

## Examples ##
### General call on terminal ###
```bash
	export WEBIF_INSTALL_PREFIX=$HOME/build-generic-pc/root
	GIT_HASH=`echo git describe --always --tags --dirty`
	export VERSION=2.9-git-$GIT_HASH
	export PACKAGE_NAME=my-neutrino-webif
	export PRETTY_PACKAGE_NAME=My-Neutrino-Webinterface
	make install
```

### As target for use within a Makefile ###
```bash
DEST = $(HOME)/build-generic-pc/root
SRC = $(HOME)/build-generic-pc/src
WEBIF_SRC_DIR = $(SRC)/neutrino-webif
WEBIF_GIT_URL = https://github.com/Tuxbox-Project/neutrino-webif.git

export WEBIF_INSTALL_PREFIX=$(DEST)
export VERSION="2.9.$$(git -C $(WEBIF_SRC_DIR) rev-list HEAD --count)-$$(git -C $(WEBIF_SRC_DIR) describe --always --tags)"
export PACKAGE_NAME="my-neutrino-webif"
export PRETTY_PACKAGE_NAME="My-Neutrino-Webinterface"

webif: $(WEBIF_SRC_DIR)
$(WEBIF_SRC_DIR):
	if [ ! -d $(SRC)/$@/.git ]; then \
		git clone $(WEBIF_GIT_URL) $(SRC)/$@; \
	else \
		git -C $(SRC)/$@ pull -r -f origin master; \
	fi
	cd $(SRC)/$@ && \
		make install

clean: webif-clean
webif-clean:
	cd $(WEBIF_SRC_DIR) && make clean
```

# Clean up the installation path #

```bash
	make clean
```
