require "rubygems" # I know...I know...don't do this

require 'crack'
require 'yaml'


class Hoptoad
  
  attr_accessor :file_path
  
  attr_accessor :errors
  
  def fetch
    self.errors = raw_data["groups"]
  
    return true
  rescue
    puts $!
    return false
  end
  
  def display
    raw_data.to_yaml
  end
  
  # As XML
  def raw_data
    Crack::XML.parse File.read(self.file_path)    
  end
  
end