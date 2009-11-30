module DevDash
  class RunCodeRun < Base  
    format :json
    
    attr_accessor :uri, :username
  
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
      # Crack::JSON.parse File.read(self.file_path)    
      HTTParty.get(uri)
    end
  end
end