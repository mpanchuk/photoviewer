class User < ActiveRecord::Base

  devise :database_authenticatable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :comments

  def token_expired?
    expires_at < DateTime.now
  end

  def token
    ::PicasaApi::RefreshToken.call self if token_expired?
    super
  end

  def self.find_for_google_oauth2 omniauth
    user = User.where(email: omniauth.info.email).first

    if user
      user.update_attributes! token: omniauth.credentials.token,
        expires_at: Time.at(omniauth.credentials.expires_at.to_i)
    else
      user = User.create name: omniauth.info.name,
        email: omniauth.info.email,
        uid: omniauth.uid,
        token: omniauth.credentials.token,
        refresh_token: omniauth.credentials.refresh_token,
        expires_at: Time.at(omniauth.credentials.expires_at.to_i)
    end
    user
  end

end