#!/bin/sh

CurrentTime()
{
echo @ $(( ( (3600 * ($hours - 1) ) + (60 * $minutes) ) * 10 / 864 ))
}

CalculateHoursMinutes() {
   X=$1

   # Beats to seconds
   bts=$(( (X * 86400) / 1000 ))

   # Hours from secs
   hours=$((bts / 3600))

   # Mins
   minutes=$(((bts % 3600) / 60))

   # Secs
   seconds=$((bts % 60))

 echo "$bts seconds = $hours hours, $minutes minutes, $seconds seconds"
}

hours=`TZ=UTC-01 /usr/bin/date +"%H"`
minutes=`TZ=UTC-01 /usr/bin/date +"%M"`
seconds=`TZ=UTC-01 /usr/bin/date +"%S"`

while getopts ":sb:" option; do
   case $option in
      s) # display beats at specific time
        hours=$2
                minutes=$3
               ;;
        b)
        CalculateHoursMinutes $2
        exit
        ;;
   esac
done
a=$(CurrentTime)
echo $a
