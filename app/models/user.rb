class User < ActiveRecord::Base
  serialize :assignments, Array
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         
  
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        
        if(auth.info.email.include? "@tamu.edu")
        user.email = auth.info.email
        else
          return false
        end
        
        user.premission = "student"
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
      end
    end
     
    
     $tassignment = 0
     $cuser = 0
    

    
    
    
    

    
  
end
