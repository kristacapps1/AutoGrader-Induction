class Assignment < ActiveRecord::Base
  
    @@sections = ["501", "502", "503"]
    
    def self.sections
        @@sections
    end

end
