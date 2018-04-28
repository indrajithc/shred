#! /bin/bash
# created by indrajith c source from  <https://github.com/indrajithc/shred>
nr8281=$PWD

ME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

find $nr8281 -type f | while read -r file || [[ -n "$file" ]]; do 
NAME=`echo ${file##*/}`
if [ "${NAME}" != "${ME}" ]; then  
	shred -vuz "$file"
fi
done

find $nr8281 -depth -type d | while read -r dir || [[ -n "$dir" ]]; do
	if [ "$PWD" != "$dir" ]; then
		rmdir "$dir"
	fi
done

if [ "$(ls -A $DIR)" ] && [ "$(ls -A)" = "${ME}" ] ; then
	shred -vuz $0
	clear;
	echo "master i am signing out !! "

fi
