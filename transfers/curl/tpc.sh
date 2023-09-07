RANUID=`cat /proc/sys/kernel/random/uuid | sed 's/[-]//g' | head -c 20; echo;`
ID=$1
UCSD_MAC=$2
CALTECH_MAC=$3

count=0
while [ $count -ne 100 ]
do
  curl -L -X COPY -H "Overwrite: T" -H "TransferHeaderAuthorization: Bearer $UCSD_MAC" -H "Authorization: Bearer $CALTECH_MAC" -H "Source: https://xrootd-sense-ucsd-redirector.sdsc.optiputer.net:1094//testSourceFile$ID" https://sense-redir-01.ultralight.org:1094/store/temp/testDestFile$RANUID --cert $X509_USER_CERT --key $X509_USER_KEY --capath /etc/grid-security/certificates/
#  gfal-rm https://sense-redir-01.ultralight.org:1094/store/temp/testDestFile$RANUID
  count=`expr $count + 1`
  echo $count
done


