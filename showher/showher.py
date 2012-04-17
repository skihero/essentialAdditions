#!/usr/bin/python 
#
#  Take a screenshot of the screen and return 
#  a imgur url
#
#  TODO: Rewrite !! 

import gtk.gdk
import pycurl
import xml.dom.minidom
import StringIO
import gtk
import sys 
import pynotify 


from time import gmtime, strftime

WRONG="Something wrong with perform" 
IMG_INF="Imgured the"


w = gtk.gdk.get_default_root_window()
sz = w.get_size()
print "The size of the window is %d x %d" % sz
pb = gtk.gdk.Pixbuf(gtk.gdk.COLORSPACE_RGB,False,8,sz[0],sz[1])
pb = pb.get_from_drawable(w,w.get_colormap(),0,0,0,0,sz[0],sz[1])

if (pb != None):

    imgfile = "screenshot" + strftime("%Y_%m_%d_%H_%M_%S", gmtime()) + ".png" 
    cookie_file_name = "/tmp/cookie_file"
    url_file ="/tmp/url_file"

    print imgfile
    pb.save(imgfile,"png")
    
    print "Screenshot saved to screenshot.png."
    
    pynotify.init("Image_up")    

    c = pycurl.Curl()
    
    values = [("key", "e85c0044b9222bc9a2813679a452f54f"),
    	  ("image", (c.FORM_FILE, imgfile))]
    		
    buf = StringIO.StringIO()
    
    c.setopt(c.URL, "http://imgur.com/api/upload.xml")
    c.setopt(c.HTTPPOST, values)
    c.setopt(c.COOKIEFILE, cookie_file_name)
    c.setopt(c.COOKIEJAR, cookie_file_name)
    c.setopt(c.WRITEFUNCTION, buf.write)
    
    print "before perform" 
   
    if c.perform():
        n = pynotify.Notification(WRONG)
	n.set_urgency(pynotify.URGENCY_LOW)
	c.close() 
	n.show()
	sys.exit() 
	

    result = buf.getvalue()
    c.close()
    
    doc = xml.dom.minidom.parseString(result)
    
    url = doc.getElementsByTagName("original_image")[0].childNodes[0].nodeValue  
    print url 

    
    n = pynotify.Notification(IMG_INF, url )
    n.set_urgency(pynotify.URGENCY_LOW)
    n.show()
   
    
    clip = gtk.Clipboard()
    clip.set_text('\n'.join(url) ) 
    clip.store() 

    # Keep a record of the urls 
    
    f = open ( 'url_list', 'a' )
    f.write(url)
    f.write("\n")
    f.close()
    

     
else:
    print "Unable to get the screenshot."



