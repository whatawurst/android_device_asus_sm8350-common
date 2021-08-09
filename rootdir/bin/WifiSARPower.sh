#ReceiverOn=`getprop vendor.asus.sar.audio`
Wifion=`getprop wlan.driver.status`
Country=`getprop vendor.asus.operator.iso-country`
#SKU=`getprop ro.boot.id.prj`
#CustomerID=`getprop ro.config.CID`
#Wigigon=`getprop vendor.wigig.driver.status`
Softapon=`getprop vendor.asus.sar.softap`
#WlanDbs=`getprop vendor.wlan.dbs`
#Slm=`getprop vendor.asus.sar.sla`

log -t WifiSARPower enter Wifion=$Wifion Softapon=$Softapon Country=$Country

if [ "$Wifion" == "ok" ] || ["$Softapon" == "ok"]; then
        case "$Country" in
            *"IT"* | *"DE"* | *"UK"* | *"BE"* | *"NL"* | *"ES"* | *"DK"* | *"FI"* | *"NO"* | *"SE"* | *"PT"* |*"PL"* | *"RO"* | *"CZ"* | *"SK"* | *"HU"* )
                if [ "$Softapon" == "ok" ]; then
                    vendor_cmd_tool -f /vendor/bin/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 7 --NUM_SPECS 2 --SAR_SPEC --NESTED_AUTO --CHAIN 0 --POW_IDX 7 --END_ATTR --NESTED_AUTO --CHAIN 1 --POW_IDX 7 --END_ATTR --END_ATTR --END_CMD

                    log -t WifiSARPower CE Hotspot
                else
                    vendor_cmd_tool -f /vendor/bin/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 7 --NUM_SPECS 2 --SAR_SPEC --NESTED_AUTO --CHAIN 0 --POW_IDX 6 --END_ATTR --NESTED_AUTO --CHAIN 1 --POW_IDX 6 --END_ATTR --END_ATTR --END_CMD

                    log -t WifiSARPower CE
                fi
        ;;
        "IN")
                if [ "$Softapon" == "ok" ]; then
                    vendor_cmd_tool -f /vendor/bin/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 7 --NUM_SPECS 2 --SAR_SPEC --NESTED_AUTO --CHAIN 0 --POW_IDX 9 --END_ATTR --NESTED_AUTO --CHAIN 1 --POW_IDX 9 --END_ATTR --END_ATTR --END_CMD

                    log -t WifiSARPower IN Hotspot
                else
                    vendor_cmd_tool -f /vendor/bin/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 7 --NUM_SPECS 2 --SAR_SPEC --NESTED_AUTO --CHAIN 0 --POW_IDX 8 --END_ATTR --NESTED_AUTO --CHAIN 1 --POW_IDX 8 --END_ATTR --END_ATTR --END_CMD

                    log -t WifiSARPower IN
                fi
        ;;
        *"US"* | *"CA"* | *"AR"* | *"CL"* | *"BR"* )
                if [ "$Softapon" == "ok" ]; then
                    vendor_cmd_tool -f /vendor/bin/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 7 --NUM_SPECS 2 --SAR_SPEC --NESTED_AUTO --CHAIN 0 --POW_IDX 10 --END_ATTR --NESTED_AUTO --CHAIN 1 --POW_IDX 10 --END_ATTR --END_ATTR --END_CMD

                    log -t WifiSARPower FCC Hotspot
                else
                    vendor_cmd_tool -f /vendor/bin/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 7 --NUM_SPECS 2 --SAR_SPEC --NESTED_AUTO --CHAIN 0 --POW_IDX 6 --END_ATTR --NESTED_AUTO --CHAIN 1 --POW_IDX 6 --END_ATTR --END_ATTR --END_CMD

                    log -t WifiSARPower FCC
                fi
        ;;
        "FR" )
                if [ "$Softapon" == "ok" ]; then
                    vendor_cmd_tool -f /vendor/bin/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 7 --NUM_SPECS 2 --SAR_SPEC --NESTED_AUTO --CHAIN 0 --POW_IDX 11 --END_ATTR --NESTED_AUTO --CHAIN 1 --POW_IDX 11 --END_ATTR --END_ATTR --END_CMD

                    log -t WifiSARPower FR Hotspot
                else
                    vendor_cmd_tool -f /vendor/bin/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 7 --NUM_SPECS 2 --SAR_SPEC --NESTED_AUTO --CHAIN 0 --POW_IDX 6 --END_ATTR --NESTED_AUTO --CHAIN 1 --POW_IDX 6 --END_ATTR --END_ATTR --END_CMD

                    log -t WifiSARPower FR
                fi
        ;;
        esac
fi
