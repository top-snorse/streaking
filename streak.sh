#!/bin/bash

NUMDAYS="365"
if [ $# -gt 0 ]; then
    NUMDAYS=$1
fi

# date -d "-X days"
i="0"
while [ $i -lt $NUMDAYS ]
do
    TOUCH_DATE=`date +%Y-%m-%d -d "1970-01-01 + $i days"`
    GIT_DATE=`date -d "1970-01-01 + $i days"`
    touch $TOUCH_DATE --date "$TOUCH_DATE"

    git add $TOUCH_DATE
    GIT_AUTHOR_DATE=$GIT_DATE GIT_COMMITTER_DATE=$GIT_DATE git commit -m "$TOUCH_DATE"

    i=$[$i+1]
done
