#!/bin/bash
DAYS_IN_MONTH=$(($(cal | wc -w) - 9))
CURRENT_MONTH=$(date +"%m")
CURRENT_YEAR=$(date +"%y")
current=1
PATH="./daily"

cd daily

while [ $current -le $DAYS_IN_MONTH ]
  do
    value="${current}-${CURRENT_MONTH}-${CURRENT_YEAR}.md"
    if test -f $value; then
      echo "$value exists"
    else
      echo "# ${value}" > $value
      echo "- [ ] Create your first task for the day!" >> $value
      touch $value
    fi
    current=$(( $current + 1 ))
  done
