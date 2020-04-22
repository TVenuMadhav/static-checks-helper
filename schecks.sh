#!/bin/bash

echo '*******************STATIC*CHECKS******************'
echo '**************************************************'
list=$(git status | grep -E '\.py' | cut -c 12-)
for i in "${list[@]}"
do
  echo '#####FLAKE8########'
  flake8 ${i}
  echo '#####DONE#################'
  echo '######ISORT#######'
  isort ${i}
  echo '######DONE################'
  echo '######MYPY#######'
  mypy ${i}
  echo '#####DONE################'
done
