class GetData

  CODE_OK = 200
  def self.info_genres
    responsegenre = Faraday.get "https://api.themoviedb.org/3/genre/movie/list?api_key=#{ENV["API_KEY"]}&language=en-US"
    self.handle_response(responsegenre.status)
    return responsegenre.body
  end

  def self.info_films(year,range,genresId)
    responsefilms = Faraday.get "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["API_KEY"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&with_genres=#{genresId.join(",")}&year=#{year}&with_watch_monetization_types=flatrate&vote_average.lte=#{range}"
    self.handle_response(responsefilms.status)
    return JSON.parse(responsefilms.body)
  end

  def self.info_film_by_id(id)
    responsefilm = Faraday.get "https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV["API_KEY"]}&language=en-US"
    self.handle_response(responsefilm.status)
    byebug
    return responsefilm.body
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
