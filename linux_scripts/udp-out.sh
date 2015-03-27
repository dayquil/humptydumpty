#!/bin/bash
if [ $# -eq 1 ]
then

filename=$(date +%m.%d.%Y.%H.%M).Outgoing-UDP.report

echo "" > ./$filename
echo "***********************************************************" >> ./$filename
echo "*** PORT FREQUECY     " $(date) "    ***" >> ./$filename
echo "*** Outgoing - Destination UDP Port                     ***" >> ./$filename
echo "***********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Outgoing | grep PROTO=UDP | sed -r 's/.*DPT=(\S+).*/\1/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename
echo "" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "*** IP FREQUECY     " $(date) "    ***" >> ./$filename
echo "*** Outgoing - Destination IP Address                 ***" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Outgoing | grep PROTO=UDP | sed -r 's/.*DST=(\S+).*/\1/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename
echo "" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "*** IP AND PORT     " $(date) "    ***" >> ./$filename
echo "*** Outgoing - UDP                                    ***" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Outgoing | grep PROTO=UDP | sed -r 's/.*DST=(\S+).*DPT=(\S+).*/\1:\2/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename

echo "" >> ./$filename
echo "***********************************************************" >> ./$filename
echo "*** PING FREQUECY     " $(date) "    ***" >> ./$filename
echo "*** Outgoing - ICMP                                     ***" >> ./$filename
echo "***********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Outgoing | grep PROTO=ICMP | sed -r 's/.*DST=(\S+).*/\1/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename



less ./$filename

else
echo ""
echo "    Usage: ./udp-out.sh [/var/log/syslog]"
echo ""
echo ""
fi
 

