class Assignment < ActiveRecord::Base
  
    @@sections = ["501", "502", "503"]
    
    def self.sections
        @@sections
    end
    
    @@grades = [5, 3,1 , 0, 0]
    
    def self.grades
        @@grades
    end

end
