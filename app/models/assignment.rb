class Assignment < ActiveRecord::Base
    belongs_to :user
    @@sections = ["501", "502", "503"]
    
    def self.sections
        @@sections
    end
end
