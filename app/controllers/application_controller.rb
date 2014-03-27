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
        if (session[:weather].nil? || Time.now - session[:last_weather_lookup] > 60 * 60)
            ip = request.remote_ip
            if (ip == '127.0.0.1')
                ip = '202.171.180.162'
            end
            location = Geocoder.search(ip).first
            session[:location] = "#{location.city}, #{location.country}"
            weather = OpenWeather::Current.city(session[:location])
            session[:weather] = weather.code
            session[:last_weather_lookup] = Time.now

            # get celcius
            kelvin = weather['main']['temp']
            session[:celcius] = (kelvin - 273.15).round
        end
    end
end
