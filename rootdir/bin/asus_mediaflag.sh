#!/vendor/bin/sh
if [ ! -f "/mnt/vendor/persist/MediaFlag" ]; then
	touch /mnt/vendor/persist/MediaFlag
	echo 0 > /mnt/vendor/persist/MediaFlag
fi
value=`cat /mnt/vendor/persist/MediaFlag`
echo "asus_mediaflag=$value" > /dev/kmsg
setprop vendor.asus.mediaflag $value
