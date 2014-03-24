module ApplicationHelper
    def intellinav
        links = ''
        if @current_user
            links += "<li>#{ link_to('Log out ' + @current_user.name, login_path, :method => :delete, :confirm => 'Really log out?') } </li>"
            links += "<li>#{ link_to('Home', root_path) }</li>"
            links += "<li>#{ link_to('Categories', tasks_categories_path) }</li>"
            links += "<li>#{ link_to('Archives', tasks_archives_path) }</li>"

        else
            links += "<li>#{ link_to('Sign Up', new_user_path) } </li>
             <li>#{ link_to('Sign in', login_path) } </li>"
        end
        
        if @current_user && @current_user.admin
            links += "<li>#{ link_to('Show users', users_path) }</li>"
        end
        links
    end
end
