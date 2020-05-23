#!/bin/sh

MOUNTDIR=$1

if [ -z "$MOUNTDIR" ] ; then
	SERVICES="/var/service/"
else
	SERVICES="${MOUNTDIR}/etc/runit/runsvdir/default/"
fi

echo "Installing services"
for service in \
	alsa bluetoothd boltd chronyd dbus dhcpcd elogind iwd popcorn snooze-daily
do
	if [ -r "/etc/sv/${service}" ] ; then
		ln -s "/etc/sv/${service}" "$SERVICES"
		echo "Installed service ${service}"
	else
		echo "Service ${service} not found"
	fi
done

echo "Setting timezone"
ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
