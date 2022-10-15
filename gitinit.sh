#! /usr/bin/bash

# creating gitignore and readme file
touch .gitignore readme.md
echo -e "node_modules \n.env" >>.gitignore
echo -e "# Welcome to my new project" >readme.md

# initializing git in the project
git init
git add .
git commit -m "project initialized"
git branch -M main

# creating a github repository and pushin the code to the repo
gh repo create -s=. -r=upstream --push --public
