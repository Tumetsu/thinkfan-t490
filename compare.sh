#!/bin/bash

find /sys/devices -type f -regex ".*/temp[1,2,3,4,5,6,7,9][2,3,4,5,6,7,8,9,0]*_input$" |sed 's/^/hwmon /g' > /home/heikki/t490/thinkfan/generated
printf "\n" >> /home/heikki/t490/thinkfan/generated
cat /home/heikki/t490/thinkfan/config >> /home/heikki/t490/thinkfan/generated

diff -q /etc/thinkfan.conf /home/heikki/t490/thinkfan/generated 1>/dev/null
if [[ $? != "0" ]]
then
  cp /home/heikki/t490/thinkfan/generated /etc/thinkfan.conf
  service thinkfan restart
  su heikki -c 'notify-send Thinkfan "Updated config" -u CRITICAL -c "device.error"'
fi
