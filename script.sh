#!/bin/bash

path="$1"
repo="$2"
tmp_log="/tmp/$repo""_readmits_logs.txt"
tmp_hashs="/tmp/$repo""_readmits_hashs.txt"
tmp_commits="/tmp/$repo""_readmits_commits.txt"

cd "$path"
echo `pwd`
git log --reverse  --oneline > $tmp_log
cat $tmp_log | cut -d " " -f 1 > $tmp_hashs
cat $tmp_hashs | xargs git show > $tmp_commits
cp $tmp_commits $1
