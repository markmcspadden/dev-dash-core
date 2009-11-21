module DevDash
  class Base
    attr_accessor :file_path, :projects  
    
    # Expected to be overriden
    def raw_data
      {}
    end
    
    def display
      raw_data.to_yaml
    end
  end
end

require File.dirname(__FILE__) << "/run_code_run"
require File.dirname(__FILE__) << "/hoptoad"

