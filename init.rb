# Include hook code here

require File.join(File.dirname(__FILE__), 'lib', 'swfobject_helper')
ActionView::Base.send :include, SWFObjectHelper