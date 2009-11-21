module DevDash
  class RunCodeRun < Base  
    attr_accessor :username
  
    def fetch
      user_hash = raw_data["user"]
    
      self.username = user_hash["username"]
      self.projects = user_hash["projects"]
  
      return true
    rescue
      puts $!
      return false
    end
  
    def raw_data
      Crack::JSON.parse File.read(self.file_path)    
    end
  end
end