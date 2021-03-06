#!/bin/bash
#
# Installs Skyperious dependencies on your local machine
# Crafted for Ubuntu systems
# Tested on Ubuntu Precise
#
# To be run from the project root
#


print_err() {
  echo $@ 2>&1
}

E_BADLOGGEDUSR=10

[ "$(id -u)" = "0" ] || exit $E_BADLOGGEDUSR


aptitude update
aptitude -y install python-wxgtk2.8 python-wxtools wx2.8-i18n
aptitude -y install libwxgtk2.8-dev libgtk2.0-dev
aptitude -y install python-dateutil
aptitude -y install python-pip


PIP_BIN=$(which pip)
$PIP_BIN install -U pip==1.4 distribute setuptools

PIP_BIN=$(which pip)
[ -f requirements.txt ] && $PIP_BIN install -r requirements.txt || print_err "install PIP requirements failed"

exit 0

