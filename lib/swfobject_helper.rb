# SwfobjectHelper
module SWFObjectHelper
  
  
  def add_content_to(name, &block)
    content_for(name) do
      yield
    end
  end
  
  
  def add_swf_object_header!
    add_content_to(:header) {javascript_include_tag 'swfobject'}
  end
  
  
  def swf_object(swf, content_id, options = {})
    add_swf_object_header!
    
    swfcode = <<EOD
    var %s = swfobject.embedSWF(
        %s, %s, 
        %s, %s, 
        %s, '/flash/playerProductInstall.swf', 
        %s, %s, %s);
    
EOD
    width = options[:width] || 100
    height = options[:height] || 100
    flash_vars = options[:flash_vars] || {}
    params = options[:params] || {}
    attributes = options[:attributes] || {}
    flash_version = options[:version] || '9.0.0'
    
    varname = options[:varname] || 'swf'
    javascript_tag do
      vars =[swf, content_id, width, height,flash_version, flash_vars, params, attributes].map {|x| x.to_json}
      swfcode % [varname, vars].flatten
    end
    
  end
end