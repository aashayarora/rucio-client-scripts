UCSD_MAC=$(curl -L -H "X-No-Delegate:true" -H "Credential: none" --capath /etc/grid-security/certificates/ --cert $X509_USER_CERT --key $X509_USER_KEY -X POST -H "Content-Type:application/macaroon-request" -X POST -d '{"caveats": ["activity:DOWNLOAD,LIST,UPLOAD,DELETE"], "validity": "PT120M"}' https://xrootd-sense-ucsd-redirector.sdsc.optiputer.net:1094 2> /dev/null | grep -o '"macaroon":.*' | awk -F'"' '{print $4}')

CALTECH_MAC=$(curl -L -H "X-No-Delegate:true" -H "Credential: none" --capath /etc/grid-security/certificates/ --cert $X509_USER_CERT --key $X509_USER_KEY -X POST -H "Content-Type:application/macaroon-request" -X POST -d '{"caveats": ["activity:DOWNLOAD,LIST,UPLOAD,DELETE"], "validity": "PT120M"}' https://sense-redir-01.ultralight.org:1094 2> /dev/null | grep -o '"macaroon":.*' | awk -F'"' '{print $4}')


END=$1
for i in $(seq 1 $END); do
  echo $i;
  sh tpc.sh $i $UCSD_MAC $CALTECH_MAC &> log-$dest-$i &
done
