#!/bin/bash
if [ $# -eq 1 ]
then

filename=$(date +%m.%d.%Y.%H.%M).Incoming-UDP.report

echo "" > ./$filename
echo "***********************************************************" >> ./$filename
echo "*** PORT FREQUECY     " $(date) "    ***" >> ./$filename
echo "*** Incoming - UDP                                      ***" >> ./$filename
echo "***********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Incoming | grep PROTO=UDP | sed -r 's/.*DPT=(\S+).*/\1/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename
echo "" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "*** IP FREQUECY     " $(date) "    ***" >> ./$filename
echo "*** Incoming - UDP                                    ***" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Incoming | grep PROTO=UDP | sed -r 's/.*SRC=(\S+).*/\1/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename
echo "" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "*** IP AND PORT     " $(date) "    ***" >> ./$filename
echo "*** Incoming - UDP                                    ***" >> ./$filename
echo "*********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Incoming | grep PROTO=UDP | sed -r 's/.*SRC=(\S+).*DPT=(\S+).*/\1:\2/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename

echo "" >> ./$filename
echo "***********************************************************" >> ./$filename
echo "*** PING FREQUECY     " $(date) "    ***" >> ./$filename
echo "*** Incoming - ICMP                                     ***" >> ./$filename
echo "***********************************************************" >> ./$filename
echo "" >> ./$filename
cat $1 | grep -i Incoming | grep PROTO=ICMP | sed -r 's/.*SRC=(\S+).*/\1/' | sort | uniq -c | sort -r --sort=general-numeric >> ./$filename
echo "" >> ./$filename



less ./$filename

else
echo ""
echo "    Usage: ./udp-in.sh [/var/log/syslog]"
echo ""
echo ""
fi
 

