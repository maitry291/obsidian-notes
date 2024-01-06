#!/bin/bash

git add .
git commit -m "Updated: `date +'%Y-%m-%d %H:%M:%S'`"
git push -u origin main

exit 0
