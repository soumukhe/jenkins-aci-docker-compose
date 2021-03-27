#!/bin/bash

SHOW=$3


NAME=$1
LASTNAME=$2

if [ "$SHOW" = "true" ]
then
   echo "Hello, $NAME $LASTNAME"
else
   echo "if you want to see the name, please mark the show option"
fi
