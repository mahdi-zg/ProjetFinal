module Admin

    class ApplicationController < ::ApplicationController

    before_action :only_admin

        private

    def only_admin


            if !user_signed_in? || current_user.role != 'admin'
    
                redirect_to new_user_path, danger: "vous n'avez pas le droit d'acceder acette page !"
            end
    

    end


    end
end
