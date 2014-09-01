module PicasaApi
  class GetPhotos < Base
    # I need more information about application, to make
    # proper decision about storing albums and photos in application.
    # That's will prevent over limiting requests to Google API
    # Also it's possible to implement sync etc.
    def call current_user, album_id
      uri = URI.parse BASE_URL + "/user/#{current_user.uid}/albumid/#{album_id}?access_token=#{current_user.token}&alt=json&max-results=3"
      response = http.get uri.request_uri
      return {} unless response.code == "200"
      data = JSON.parse response.body
      return {} if data["feed"].blank?

      data["feed"]["entry"].map do |entry|
        {
          id:          entry["gphoto$id"]["$t"],
          title:       entry["title"]["$t"],
          album_title: data["feed"]["title"]["$t"],
          photo_url:   entry["media$group"]["media$content"][0]["url"]
        }
      end
    end
  end
end