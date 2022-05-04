pkill polybar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload $1 &
  done
else
  polybar --reload $1 &
fi

