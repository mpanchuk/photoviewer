class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.find_for_google_oauth2 request.env["omniauth.auth"]

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end
end