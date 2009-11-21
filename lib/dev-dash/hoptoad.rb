module DevDash
  class Hoptoad < Base  
    attr_accessor :errors
  
    def fetch
      self.errors = raw_data["groups"]
  
      return true
    rescue
      puts $!
      return false
    end
  
    # As XML
    def raw_data
      Crack::XML.parse File.read(self.file_path)    
    end
  end
end