#!/bin/sh

/root/DropboxKayhan/kayhan.sh monitor /  | while read line
do
    case "$line" in
           *'kdbx'*)
           filename=$(echo $line | cut -d " " -f 3 - | cut -d "" -f2 -  )
           echo $filename
           echo "Pass db editlendi"
           /root/DropboxKayhan/kayhan.sh download $filename /passdbbackups/
           sleep 1
           cp /passdbbackups/$filename /home/pi/Desktop/kayhan.kdbx
           sleep 1
           chown pi:pi /home/pi/Desktop/kayhan.kdbx
           sleep 1
           mv /passdbbackups/$filename  /passdbbackups/kayhan_$(date +%d).$(date +%m).$(date +%Y)_$(date +%H).$(date +%M).kdbx
           find /passdbbackups/*.kdbx -mtime +30 -type f -delete
           ;;
    esac
done

exit 0
