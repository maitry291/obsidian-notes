#!/bin/bash

msg=${*:-'regular upload'}

git add .
git commit -m "$msg: `date +'%Y-%m-%d %H:%M:%S'`"
git push -u origin main

exit 0
