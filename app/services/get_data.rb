class GetData

  CODE_OK = Rack::Utils::HTTP_STATUS_CODES.select { |key, value| value == 'OK' }.keys[0]
  def info_genres
    responsegenre = Faraday.get "https://api.themoviedb.org/3/genre/movie/list?api_key=#{ENV["API_KEY"]}&language=en-US"
    self.handle_response(responsegenre.status)
    return responsegenre
  end

  def self.info_films
    responsefilms = Faraday.get "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["API_KEY"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
    self.handle_response(responsefilms.status)
    return responsefilms
  end

  def self.info_film_by_id(id)
    responsefilm = Faraday.get "https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV["API_KEY"]}&language=en-US"
    self.handle_response(responsefilm.status)
    return responsefilm
  end

  private

  def self.handle_response(responsecode)
    if responsecode == CODE_OK
      Rails.logger.info "#{Rack::Utils::HTTP_STATUS_CODES[200]}" 
    else
      Rails.logger.info "#{ Rack::Utils::HTTP_STATUS_CODES[204]}"
    end
  end
end
