#!/usr/bin/env bash
repo-add hayao.db.tar.gz *.pkg.tar.xz
rm *.old
git stage *
git add *
printf "変更点を入力 : "
read cmt
git commit -m "$cmt"
git push