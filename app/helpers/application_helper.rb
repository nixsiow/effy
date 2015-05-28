module ApplicationHelper
    def intellinav
        links = ''
        if @current_user
            links += "<li>#{ link_to(@current_user.name, user_path(@current_user)) }</li>"
            links += "<li>#{ link_to('New task', new_task_path) }</li>"
            links += "<li>#{ link_to('Logout', login_path, :method => :delete, :confirm => 'Are you sure?') }</li>"
        else
            links += "<li>#{ link_to('Register', new_user_path) }</li>"
            links += "<li>#{ link_to('Login', login_path) }</li>"
        end

        if @current_user && @current_user.admin
            links += "<li>#{ link_to('Show users', users_path) }</li>"
        end
        links
    end

    def weather_icon(code)
        case code
        when 200 .. 232
            'ion-ios7-thunderstorm-outline'
        when 300 .. 321, 500 .. 531
            'ion-ios7-rainy-outline'
        when 600 .. 622
            'ion-ios7-snowy'
        when 800
            'ion-ios7-sunny-outline'
        when 802 .. 804
            'ion-ios7-cloud-outline'
        when 801
            'ion-ios7-cloudy'
        else
            'ion-alert-circled'
        end
    end
end
