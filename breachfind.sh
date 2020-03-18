#!/bin/bash
# breachfind.sh v0.3
# Author: daphiel 

CLIENTI=(
		"myorgtomonitor.net"
		"myorgtofind.it"
		"myorgtoprotect.com"
)

case "$1" in
        -p|printonly)
		for CHECKS in "${CLIENTI[@]}"
			do
		echo Controllo $CHECKS 
		fgrep -rc $CHECKS . | awk -F: '{ s+=$2 } END { print s }'
		done
        ;;
        -w|write)
		for CHECKS in "${CLIENTI[@]}"
			do
			echo Controllo $CHECKS 
			fgrep -r $CHECKS . > /tmp/"$CHECKS"_results.txt
			cat /tmp/"$CHECKS"_results.txt | wc -l 
		done
		mv /tmp/*_results.txt .
	;;
	-c|compressed)
	find . | grep -E '.*\.(rar|.zip|.7z|.gz|.tar|.tgz)'
	;;
	*)
            echo "$0 loaded!"
            echo
            echo "Usage: $0 {-p|-w|-c}"
            echo "	-p   : print only (global count)"
            echo "	-w   : write results in TXT's"	
            echo "	-c   : check for compressed files (rar|zip|7z|gz|tar|tgz)"	
            exit 1
esac
#Mac Users Only
osascript -e 'display notification "Breach Find" with title "Attivita eseguita"'
mpg123 /Applications/iMovie.app/Contents/Resources/iMovie\ Sound\ Effects/Alarm.mp3 2>/dev/null
