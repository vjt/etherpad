#!/bin/bash -e

#  Copyright 2009 Google Inc.
#  
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#  
#       http://www.apache.org/licenses/LICENSE-2.0
#  
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS-IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

user="etherpad"
host="localhost"
password="etherpad"
db="etherpad"

mysql="mysql"

case $#
  0) mysql="$mysql -u root" ;;
  1) mysql="$mysql -u root -p$1" ;;
  2) mysql="$mysql -u $1 -p$2" ;;
  *) echo "Usage: $0 [user] [password]"; exit 1 ;;
esac

echo "Creating database '${db}'..."
echo "CREATE DATABASE ${db};" | ${mysql}

echo "Granting priviliges..."
echo "GRANT ALL PRIVILEGES ON ${db}.* TO '$user'@'$host' IDENTIFIED BY '$password';" | ${mysql}

echo "Success"
