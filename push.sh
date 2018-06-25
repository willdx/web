#!/bin/bash
echo "更新文章:$1"
gitbook build
cp -r _book/* .
git add --all
git commit -m "$1"
git push origin master
echo "Finish! next start local serve"
gitbook serve
