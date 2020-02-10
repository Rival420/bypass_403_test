#!/bin/bash

domains=`echo ${1:-$(</dev/stdin)}`
read -ra domainarray <<< $domains

#gtfo="http://google.com/" #target [IMPORTANT] atm it only works when giving a full url (http://domain/)
#wordlist="/usr/share/common.txt" #change this to a better wordlist
wordlist="testwordlist"
#echo '' > urlsfy #make file empty; I wanted to work with variables but didn't work like I wanted it to do

i=0

for gtfo in ${domainarray[@]}
do
        printf "[+] testing for domain: $gtfo \n\n"
        #test=`echo $(gobuster dir -w $wordlist -u $gtfo -e)` #-r -n -q -s 403 -f | grep -v "icons" >> urlsfy )
        #read -r -a testarray <<< $test 
        #read -ra clean <<< $(echo -n `for lol in "${testarray[@]}";do if [[ ${lol:0:4} == 'http' ]] ;then echo $lol $
        #echo ${clean[@]}
        gobuster dir --wildcard -w $wordlist -u $gtfo -e -q -k -a 'Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/201$
        fuck=$! #this was for debug purposes
        i=$((i+1))  # increase i every loop
        if [[ $((i%20)) == '0'  ]]; then : 
                wait $!   # if i is divisible by 20, wait for gobuster processes to end. This way 20 gobuster will ru$
        fi
done
wait $! # without this, script will not wait for last gobusters to finish and next loop can't check for those
#i=0
for url in $(cat dirscan_results/* | grep '(Status: 403)'| awk '{print $1}');do
       # printf "here is the url: $url" # was just to see if it creates the test urls properly. here they should be i$
        domain=`echo $url | cut -d / -f 3`
        path=`echo $url | sed -n 's/.*\/\///p'   | sed -n "s/^$domain//p"` #path can be like "/first/second" so we ca$
        scheme=`echo $url | cut -d ':' -f 1` # scheme can be http or https and we need it for the curl request
        echo -e "\nscheme:$scheme\nhere: $domain\npath:$path"
        #printf "\n"
        curl "$scheme://$domain/%2e$path" #%2e test :d
done
