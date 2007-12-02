#!/bin/env sh

# This file is part of the Roverbar MP3-Station.
#
# The Roverbar MP3-Station is free software: you can redistribute it 
# and/or modify it under the terms of the GNU General Public License 
# as published by the Free Software Foundation, either version 3 of 
# the License, or (at your option) any later version.
# 
# The Roverbar MP3-Station is distributed in the hope that it 
# will be useful, but WITHOUT ANY WARRANTY; without even the 
# implied warranty of MERCHANTABILITY or FITNESS FOR A 
# PARTICULAR PURPOSE.  See the GNU General Public License for 
# more details.
#
# You should have received a copy of the GNU General Public License
# along with the Roverbar MP3-Station.  If not, see 
# <http://www.gnu.org/licenses/>.
#
# 2007 - Lucas S. Bickel v/o Karbon <karbon@pfadipatria.com>
#
# tool welches statistische daten wegkopiert vor dem runterfahren
# mehr dazu ist in /root/README dokumentiert

# basis ordner fuer stats
BASE_DIR=/var/tmp/roverbar-stats

# erstmal ein ablageort einrichten (und einen namen bestimmen!)
UNIX_TS=`date +%s`
STATS_DIR="$BASE_DIR/haltlog$UNIX_TS"
mkdir -p $STATS_DIR

# lokale hds auswerten (alle in fstab und /media)
df `awk '/\/media\// {print $1}' /etc/fstab` > "$STATS_DIR/local_drives"

# uptime ablegen
uptime > "$STATS_DIR/uptime"

# einstellungen aus amarok als tarball zur seite legen
OLD_PWD=`pwd`
cd /home/roverbar/.kde/share/apps/amarok
tar -zcvf "$STATS_DIR/amarok.tgz" --no-recursion * 
cd $OLD_PWD

# liste der mp3s (inkl groesse) ablegen 
find /media/ -type f -exec du {} \; > $STATS_DIR/sound.LST

exit
