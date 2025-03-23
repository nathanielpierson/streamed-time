require 'http'
require './base'

module StreamedTime

  class Streamed_time < Base_test


    def self.statement(streamer)
      request = HTTP.headers(:client_id => "pnyd2wx6lmfrsubv7jd2rmakek0g7h").auth("Bearer v3y6hy744layrep52r2hlhdj7nmgv7").get("https://api.twitch.tv/helix/search/channels?query=#{streamer}&live_only=false")
      get_info = request.parse
      streamer_live = false
      real_streamer = false
      x = 0
         # cycles through the search results until the correct streamer comes up, then exit loop
      while real_streamer == false
        temp = get_info["data"][x]
        if temp["display_name"] == "#{streamer}"
          real_streamer = true
          # execute additional code later if streamer is currently live
          if temp["is_live"] == true
            streamer_live = true
          else
            streamer_live = false
          end
        else
          x += 1
        end
      end
      puts streamer_live
    end
  end
end

zz = ""
zz.streamed_time.statement("ikori_mario")
