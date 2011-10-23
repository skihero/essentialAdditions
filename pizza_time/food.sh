#!/usr/bin/python

#
# Timeout never expires 
# Icons are stolen from the other places 
#	
import pynotify

if __name__ == '__main__':
  try:
	pynotify.init("Lunch")

	uri = "file://" + "/usr/share/pixmaps/pidgin/emotes/default/pizza.png"
	msg = pynotify.Notification("Lunch", "Go have food", uri)
	msg.set_timeout(0)
	
 	if not	msg.show(): 
	     print "Failed to display food notification " 
	     sys.exit(1) 

  except Exception as detail: 
        print 'Exception: ', detail 		
