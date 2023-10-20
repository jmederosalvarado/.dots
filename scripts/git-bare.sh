#!/usr/bin/env bash
set -e

# Examples of call:
# git-bare git@github.com:name/repo.git
# => Clones to a /repo directory
#
# git-bare git@github.com:name/repo.git my-repo
# => Clones to a /my-repo directory

url=$1
basename=${url##*/}
name=${2:-${basename%.*}}

mkdir "$name"
cd "$name"

# check if url starts with git@ or https:// using posix
if [[ $url == git@* ]] || [[ $url == https://* ]]; then
    git clone --bare "$url" .bare
else
    git clone --bare "git@github.com:$url" .bare
fi

# Creates a .git file with the path to the bare repo
echo "gitdir: ./.bare" > .git

# Explicitly sets the remote origin fetch so we can fetch remote branches
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

# Gets all branches from origin
git fetch origin
