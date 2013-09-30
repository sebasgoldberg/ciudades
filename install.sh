#!/bin/bash

function get_ambient_parameter
{
  echo "$(python -c "from ciudades.ambiente import ambiente; print ambiente.$1" )"
}

git clone https://github.com/sebasgoldberg/ciudades.git

cd ciudades

DB_NAME="$(get_ambient_parameter "db.name")"
DB_USER="$(get_ambient_parameter "db.user")"
DB_PASS="$(get_ambient_parameter "db.password")"

echo "Se procede a crear base de datos y usuario de base de datos, por favor introduzca la contraseña del usuario root:"

(echo "create database $DB_NAME character set utf8;"
echo "create user '$DB_USER'@'localhost' identified by '$DB_PASS';"
echo "grant all on $DB_NAME.* to $DB_USER;"
) | mysql -u root -p

if [ $? -ne 0 ]
then
  echo "ERROR: No se ha podido crear usuario $DB_USER y base de datos $DB_NAME."
  exit 1
fi

./manage.py syncdb
./manage.py migrate

# instalacion de datos
sudo ./manage.py cities_light
