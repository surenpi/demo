#!/bin/sh

rm -rfv test.zip
wget $1 -O test.zip
unzip test.zip
chmod u+x jcli
