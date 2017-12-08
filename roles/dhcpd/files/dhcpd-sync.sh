#!/bin/bash


file_dhcp="/etc/dhcp/dhcpd-subnet.conf"
md5master=$(md5sum ${file_dhcp})
md5slave=$(ssh dhcp-slave md5sum ${file_dhcp})

if [ "${md5master}" != "${md5slave}" ] ; then
    rsync -avP ${file_dhcp} dhcp-slave:${file_dhcp}
    systemctl force-reload isc-dhcp-server.service
    ssh dhcp-slave systemctl force-reload isc-dhcp-server.service
fi
