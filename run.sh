#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
node_modules/coffee-script/bin/coffee source/updateUserList.coffee > /dev/null
