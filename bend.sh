#!/usr/bin/python
import pynotify
import urllib 

if __name__ == '__main__':
  try:
	pynotify.init("Bend")

	uri = "file://" + "/usr/share/pixmaps/faces/fish.jpg"
	bend = urllib.urlopen('http://slashdot.org').headers.headers[3]
	print bend
	bend_says = "" + bend 

	msg = pynotify.Notification("Bend", bend_says, uri)
	msg.set_timeout(0)
	
 	if not	msg.show(): 
	     print "Failed to display Bend notification " 
	     sys.exit(1) 

  except Exception as detail: 
        print 'Exception: ', detail 		
