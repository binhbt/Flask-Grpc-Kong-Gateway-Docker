#!/usr/bin/env sh

file=/tmp/file.log
maxsize=$((${LOG_SIZE_MAX}*1024))
actualsize=$(wc -c <"$file")
if [ $actualsize -ge $maxsize ]; then
    echo 'size is over $maxsize bytes' >> /tmp/log.log
    echo '' > $file
else
    echo 'size is under $maxsize bytes' >> /tmp/log.log
fi