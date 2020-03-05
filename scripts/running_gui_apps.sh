for wid in `wmctrl -l | cut -d' ' -f1`
do 
	xprop -id $wid | grep WM_CLASS | cut -d= -f2 | cut -d, -f2 | grep -oP "(?<=\").*(?=\")"
done
