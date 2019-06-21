#!/bin/bash -x

#Waits for openvpn service to become active and installs Cohesive Networks VNS3 Routing Agent

 wait_for_openvpn () {
   while :
    do
    servicestatus=`/sbin/ifconfig | grep "$IP" 2>&1`
          if [ $? = 0 ] ; then
           sudo rpm -ivh /tmp/cohesive-ra-1.1.1_x86_64.rpm;
           exit 0
          fi
        sleep 2
    done
}

#wait_for_openvpn () {
#    i=0
#    while : ; do
#        if [ "${i}" -gt "90" ]; then
#            exit 1
#        fi
#        servicestatus=`/sbin/ifconfig | grep "${VNS3OVERLAYIP}" 2>&1`
#        if [ $? = 0 ] ; then
#            rpm -ivh /tmp/cohesive-ra-1.1.1_x86_64.rpm;
#           exit 0
#        fi
#        sleep 2
#        i=$((i+1))
#    done
#}

/etc/init.d/openvpn start
wait_for_openvpn