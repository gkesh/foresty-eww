CHARGING=$(cat /sys/class/power_supply/AC0/online)

if [[ $(cat /sys/class/power_supply/AC0/online) -eq 1 ]]; then
  echo "󱐥"
else
  echo "󱊣"
fi
