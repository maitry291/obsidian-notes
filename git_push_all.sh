#!/bin/bash

msg=${*:-'regular upload'}

git add .
git commit -m "$msg"
git push -u origin main

exit 0
