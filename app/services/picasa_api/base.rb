module PicasaApi
  class Base
    include Service
    BASE_URL = "https://picasaweb.google.com/data/feed/api"

    def call
    end

    protected

    def http
      uri = URI.parse BASE_URL
      http_instance = Net::HTTP.new(uri.host, uri.port)
      http_instance.use_ssl = true
      http_instance.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http_instance
    end
  end
end