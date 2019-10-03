#!/bin/sh

set -e

chmod +x pam_keys.sh
/bin/sh pam_keys.sh

cp sshd /pam.d
unlink /etc/ssh/sshd_config || echo "success"
cp sshd_config /etc/ssh/sshd_config
cp /pam_duo_configure/pam_duo-$COREOS_VERSION/pam_duo.so /etc/pam_duo/pam_duo.so

chown root /pam_duo_configure/pam_duo.conf
chmod 400 /pam_duo_configure/pam_duo.conf
cp /pam_duo_configure/pam_duo.conf /duo
