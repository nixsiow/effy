module ApplicationHelper
    def intellinav
        links = ''
        if @current_user
            links += "<li>#{ link_to('<i class="ion-log-out">  Log out</i> '.html_safe + @current_user.name, login_path, :method => :delete, :confirm => 'Confirm if you want log out?') }</li>"

            links += "<li>#{ link_to('<i class="ion-ios7-compose">  New Effy</i>'.html_safe, new_task_path) }</li>"

            links += "<li>#{ link_to('<i class="ion-gear-b">  Dashboard</i>'.html_safe, '/users/:id', :id => @current_user.id) }</li>"
        else
            links += "<li>#{ link_to('Sign Up', new_user_path) }</li>
             <li>#{ link_to('Sign in', login_path) }</li>"
        end
        
        if @current_user && @current_user.admin
            links += "<li>#{ link_to('Show users', users_path) }</li>"
        end
        links
    end

    def weather
        
    end
end
