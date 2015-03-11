class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_filter :authenticate
    before_filter :find_weather


    private
    def authenticate
        if session[:user_id].present?
            @current_user = User.find session[:user_id]
            session[:user_id] = nil unless @current_user
        end
    end

    def find_weather
      # raise params.inspect
        if (session[:weather].nil? || Time.now - session[:last_weather_lookup] > (15 * 60))
            ip = request.remote_ip
            if (ip == '127.0.0.1')
                ip = '175.142.143.147'
            end
            location = Geocoder.search(ip).first
            session[:location] = "#{location.city}, #{location.country}"
            weather = OpenWeather::Current.city(session[:location])

            if (weather['weather'] == nil)
              session[:weather] = 800
            else
              session[:weather] = weather['weather'][0]['id']
            end

            session[:last_weather_lookup] = Time.now

            # get celcius(fake if openweather API unable to get the weather info based on the ip)
            if (weather['weather'] == nil)
              kelvin = 300.25
            else
              kelvin = weather['main']['temp']
            end

            session[:celcius] = (kelvin - 273.15).round

            # get description(fake if openweather API unable to get the weather info based on the ip)
            if (weather['weather'] == nil)
              session[:description] = "Sky is Clear"
            else
              session[:description] = weather['weather'].first['description'].capitalize
            end
        end
    end
end
