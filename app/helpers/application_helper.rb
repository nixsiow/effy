module ApplicationHelper
    def intellinav
        links = ''
        if @current_user
            links += "<li>#{ link_to(@current_user.name, user_path(@current_user)) }</li>"

            links += "<li>#{ link_to('<i class="ion-log-out grow"></i> '.html_safe, login_path, :method => :delete, :confirm => 'Do you want log out?') }</li>"

            links += "<li>#{ link_to('<i class="ion-ios7-compose grow"></i>'.html_safe, new_task_path) }</li>"
        else
            links += "<li>#{ link_to('Sign Up', new_user_path) }</li>
             <li>#{ link_to('Sign in', login_path) }</li>"
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
