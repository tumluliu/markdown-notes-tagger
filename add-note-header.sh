#!/usr/bin/env bash
TAGS="tags: [Notebooks/小树]"
TITLES="title: 2013-6-3小树妈妈笔记"
CREATED="created: '2019-07-18T21:55:01.844Z'"
MODIFIED="modified: '2019-11-24T21:20:05.929Z'"
echo 'task goes here' | cat - todo.txt > temp && mv temp todo.txt
