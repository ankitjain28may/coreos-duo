#!/bin/sh

sed -i -e "s/ikey =/ikey = $IKEY/" /pam_duo_configure/pam_duo.conf
sed -i -e "s/skey =/skey = $SKEY/" /pam_duo_configure/pam_duo.conf
sed -i -e "s/host =/host = $HOST/" /pam_duo_configure/pam_duo.conf