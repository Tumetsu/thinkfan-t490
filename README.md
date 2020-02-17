Run: `sudo /home/heikki/t490/thinkfan/compare.sh`

If the configs have changed the script will:

1. get the current configs using: `find /sys/devices -type f -regex ".*/temp[1,2,3,4,5,6,7,9][2,3,4,5,6,7,8,9,0]*_input$" |sed 's/^/hwmon /g'`
2. replace the ones in `/etc/thinkfan.conf`
4. restart the service `sudo service thinkfan restart`

N.B: we don't want to use signals 8 and 11, that's why they're not in regex.

You can use `sudo service thinkfan status` to see if everything is working.

To make this run on reboot (or login): call the script from `/etc/profile`
