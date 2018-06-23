#!/bin/bash
gitbook build
git checkout master
git add .
git commit -m $1
git push -u origin master
git checkout --orphan gh-pages
git rm --cached -r 
git clean -df\n
ls | grep -v _book | xargs rm -rf
cp -r _book/* .
git add .
git commit -m $1
git push -u origin gh-pages 
git checkout master
