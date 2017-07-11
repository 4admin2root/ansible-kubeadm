#!/bin/bash
ngx=`ps -C nginx |wc -l`
if [ $ngx -eq 1 ];then
        exit 1
fi
