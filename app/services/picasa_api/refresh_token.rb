module PicasaApi
  class RefreshToken < Base
    def call current_user
      uri = URI.parse "https://accounts.google.com/o/oauth2/token"
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      response = http.post(uri.request_uri, URI.encode_www_form({
          client_id: ENV["google_client_id"],
          client_secret: ENV["google_client_secret"],
          refresh_token: current_user.refresh_token,
          grant_type: "refresh_token"
        }))
      return unless response.code == "200"
      data = JSON.parse(response.body)
      current_user.update_attributes! token: data["access_token"], expires_at: (current_user.expires_at + data["expires_in"].to_i.seconds)
    end
  end
end