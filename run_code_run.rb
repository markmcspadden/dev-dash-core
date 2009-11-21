require "rubygems" # I know...I know...don't do this

require 'json'
require 'yaml'

class RunCodeRun
  
  attr_accessor :file_path
  
  attr_accessor :username, :projects
  
  def fetch
    rcr_json = JSON.parse File.read(self.file_path)

    user_hash = rcr_json["user"]
    
    self.username = user_hash["username"]
    self.projects = user_hash["projects"]
  
    return true
  rescue
    puts $!
    return false
  end
  
  def display
    rcr_json = JSON.parse File.read(self.file_path)
    
    rcr_json.to_yaml
  end
  
end

