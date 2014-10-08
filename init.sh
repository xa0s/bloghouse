#!/bin/bash

function die {
    printf %s "${@+$@$'\n'}" 1>&2
    exit 1
}

function log {
    echo
    echo "-->" $*
    echo
}

function help {
    cat <<-THEEND
	Usage:
	  $0 site-name
THEEND
    exit 1
}

# validate parameters
[ "$1" ] || help

# validate env
which git  || die "Requirement is missing: git"
which ruby || die "Requirement is missing: ruby"


# read parameters and init variables
BLOG=$1

log "creating a directory for a new blog..."
mkdir "$BLOG" && cd $BLOG || die "Failed to create a directory: $PWD/$BLOG"

log "downloading engine..."
git clone https://github.com/xa0s/bloghouse-engine.git engine

log "downloading general g11n files..."
git clone https://github.com/xa0s/bloghouse-g11n.git g11n

log "downloading sample layout..."
git clone https://github.com/xa0s/bloghouse-design.git design

log "downloading sample content..."
git clone https://github.com/xa0s/bloghouse-content.git content

log "preparing site directory..."
mkdir "site" && echo "done"

log "initializing bloghouse engine..."
cd engine
gem install --no-ri --no-rdoc nanoc nutils kramdown adsf rainpress i18n

log "rehashing rbenv if used..."
rbenv rehash 2>/dev/null && echo "done" || echo "no rbenv found"

log "done"
