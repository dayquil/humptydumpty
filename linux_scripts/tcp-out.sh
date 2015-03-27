#!/bin/bash
if [ $# -eq 1 ]
then
filename=$(date +%m.%d.%Y.%H.%M).Outgoing-TCP.report

echo "" > ./$filename
echo "***********************************************************" >> ./$filename
echo "*** PORT FREQUECY     " $(date) "    ***" >> ./$filename
echo "*** Outgoing - Destination TCP Port                     ***" >> ./$filename
echo "***********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Outgoing | grep PROTO=TCP | sed -r 's/.*DPT=(\S+).*/\1/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename
echo "" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "*** IP FREQUECY     " $(date) "    ***" >> ./$filename
echo "*** Outgoing - Destination TCP IP                     ***" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Outgoing | grep PROTO=TCP | sed -r 's/.*DST=(\S+).*/\1/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename
echo "" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "*** IP AND PORT     " $(date) "    ***" >> ./$filename
echo "*** Outgoing - TCP Destination IP & Port              ***" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Outgoing | grep PROTO=TCP | sed -r 's/.*DST=(\S+).*DPT=(\S+).*/\1:\2/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename

echo "" >> ./$filename
echo "***********************************************************" >> ./$filename
echo "*** PING FREQUECY     " $(date) "    ***" >> ./$filename
echo "*** Outgoing - ICMP Destination                         ***" >> ./$filename
echo "***********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Outgoing | grep PROTO=ICMP | sed -r 's/.*DST=(\S+).*/\1/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename

less ./$filename

else
echo ""
echo "    Usage: ./tcp-out.sh [/var/log/syslog]"
echo ""
echo ""
fi
 

