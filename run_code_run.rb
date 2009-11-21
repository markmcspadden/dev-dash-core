require "rubygems" # I know...I know...don't do this

require 'json'
require 'yaml'

class RunCodeRun
  
  attr_accessor :file_path
  
  attr_accessor :username, :projects
  
  def fetch
    user_hash = raw_data["user"]
    
    self.username = user_hash["username"]
    self.projects = user_hash["projects"]
  
    return true
  rescue
    puts $!
    return false
  end
  
  def display
    raw_data.to_yaml
  end
  
  def raw_data
    JSON.parse File.read(self.file_path)    
  end
  
end

