echo $(($(($(cat /sys/class/power_supply/BAT0/energy_now) * 100)) / $(cat /sys/class/power_supply/BAT0/energy_full)))
