#!/bin/bash

SCRIPT_ROOT=$(echo "$1")

PUPPET_DIR=/etc/puppet/

cp "$SCRIPT_ROOT/../puppet/Puppetfile" "$PUPPET_DIR"
echo "Copied Puppetfile"

apt-get install -y build-essential ruby-dev >/dev/null
echo 'Finished installing base packages for librarian'

apt-get install -y libgemplugin-ruby
echo 'Finished updating libgemplugin-ruby (Ubuntu only)'

echo 'Installing librarian-puppet'
gem install librarian-puppet >/dev/null
echo 'Finished installing librarian-puppet'

echo 'Running initial librarian-puppet'
cd "$PUPPET_DIR" && librarian-puppet install --clean >/dev/null
echo 'Finished running initial librarian-puppet'

