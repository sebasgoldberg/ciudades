#!/bin/bash
if [ ! -f 'ciudades/ambiente.py' ]
then
  cp ciudades/ambiente.default.py ciudades/ambiente.py
fi

vim ciudades/ambiente.py
