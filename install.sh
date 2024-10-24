#!/bin/sh

### N/A.

set -e  # Crash on first non-zero exit code.

# Local constants.
BOLTHOLE_URL="git@github.com:chairmanxco/bolthole.git"
WALLPAPER_FN="wallpaper.jpg"
# Paths.
PATH_TO_HERE=$(dirname $(realpath $0))
SRC_PATH_TO_WALLPAPER="$PATH_TO_HERE/$WALLPAPER_FN"
DST_PATH_TO_WALLPAPER="$HOME/$WALLPAPER_FN"
# Colours.
RED="\033[0;31m"
GREEN="\033[0;32m"
NO_COLOUR="\033[0m"

#######################
# INSTALL THIRD PARTY #
#######################

# Update packages.
sudo apt update
sudo apt upgrade --yes

##################
# INSTALL CUSTOM #
##################

# Install Bolthole.
cd  # Change to home directory.
if [ ! -d bolthole ]; then
    git clone $BOLTHOLE_URL
else
    echo "${GREEN}Looks like we've already got bolthole.${NO_COLOUR}"
fi

# Change wallpaper.
cp --force $SRC_PATH_TO_WALLPAPER $DST_PATH_TO_WALLPAPER
if ! pcmanfm --set-wallpaper $DST_PATH_TO_WALLPAPER; then
    echo "${RED}Something went while wrong changing wallpaper.${NO_COLOUR}"
    exit 1
fi

# Success!
echo "${GREEN}All good.${NO_COLOUR}"
