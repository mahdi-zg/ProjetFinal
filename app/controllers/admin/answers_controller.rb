
module Admin

class AnswersController < ApplicationController

    before_action :set_answers, only: [:update]


    def index
     
        @answers = Answer.all
    end

    def new
        @answers = Answer.new
    end


    def create
        puts "answer created"
        @answers = Answer.new(answers_params)
        if @answers.save

            redirect_to({action: :index}, success: "La reponse a bien été enregistrer ")
    else
           render :new
    end
    end

    def edit
    end


    def update

        if @answers.update(answers_params)

            redirect_to({action: :index}, success: "La question a bien été modifier")
        else
            render :new
        end

    end



    private

    def answers_params
        params.require(:answers).permit(:label)

    end

    def set_answers

      
        @answers = Answer.find(params[:id])
      #  Answer.exists?(user_id: current_user.id, specie_id: species.id) ? 'false' : ''
    end



end

end