class UsersController < ApplicationController

    skip_before_action :only_signed_in, only: [:new, :create, :confirm]
    before_action :only_signed_out, only: [:new, :create, :confirm]
    skip_before_action :verify_authenticity_token  

    def new 
        @user =User.new
    end

    def create
        user_params = params.require(:user).permit(:username, :email, :password, :password_confirmation).reverse_merge(role: 'User')
       
        @user = User.new(user_params)

        @user.recover_password = nil

        if @user.valid?
            @user.save
            UserMailer.confirm(@user).deliver_now

            redirect_to new_user_path, success: 'Votre compte a bien été créé, vous devriez recvoir un email pour confirmer votre compte '

          # render 'new'

        else

            render 'new'
        end
    end

    def confirm
        @user = User.find(params[:id])
        if @user.confirmation_token == params[:token]

            @user.update(confirmed: true, confirmation_token: nil)
           
            @user.save(validate: false)

            session[:auth] = @user.to_session
            redirect_to profil_path, success: 'votre compte a bien été confirmé'
        else
            redirect_to new_user_path, danger: 'ce token ne semble pas valide'

        end

    end

    def edit
        @user = current_user
        @species = Specie.all
    end

    def update

        @user = current_user

        user_params = params.require(:user).permit(:username, :firstname, :lastname, :avatar_file, :email)

        if @user.update(user_params)

            redirect_to profil_path, success:'Votre compte a bien été mis a jour '
        
        else
            render :edit
        end
    end

    def answers
        @specie = Specie.find(params[:id])
        
    end

    def respond_answer
        @specie = Specie.find(params[:specie_id])

        unless Answer.exists?(specie_id: params[:specie_id], user_id: current_user.id)
            answer = Answer.new(specie_id: params[:specie_id], user_id: current_user.id, label: params[:answer])
        
            if answer.save
                redirect_to profil_path
            else
                render :answer
            end
        else
            redirect_to profil_path
        end

        
    end
end