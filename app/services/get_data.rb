class GetData
  SUCCESS_CODE = 200

  def info_genres
    responsegenre = Faraday.get "https://api.themoviedb.org/3/genre/movie/list?api_key=#{ENV["API_KEY"]}&language=en-US"
    self.handle_response(responsegenre.status)
  end

  def info_films
    responsefilms = Faraday.get "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV["API_KEY"]}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
    self.handle_response(responsefilms.status)
  end

  private

  def handle_response(responsecode)
    if responsecode == SUCCESS_CODE
      puts "s"
    else
      puts "w"
    end
  end
end
