module DevDash
  class Hoptoad < Base  
    format :xml
    
    attr_accessor :uri, :projects_uri, :errors
  
    def fetch
      self.errors = raw_data["groups"]
      
      self.projects = raw_projects["projects"]
  
      return true
    rescue
      puts $!
      return false
    end
  
    # As XML
    def raw_data
      # Crack::XML.parse File.read(self.file_path)    
      HTTParty.get uri
    end
    
    def raw_projects
      HTTParty.get projects_uri
    end
  end
end