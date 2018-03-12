class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :require_login

  
  
  
  def google_oauth2
      
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env['omniauth.auth'])
      
      if @user == false
        redirect_to root_path, :flash => { :error => "Email choosen was not TAMU" }
        return
      end
      
      if @user.persisted?
        #flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
  end
end
