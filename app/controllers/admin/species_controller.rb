module Admin

    class SpeciesController < ApplicationController

        before_action :set_species, only: [:update, :edit, :destroy]

        def index
            @species = Specie.all
        end

        def new 
            @species = Specie.new
        end

        def create
            @species = Specie.new(species_params)
            if @species.save

                redirect_to({action: :index}, success: "L'especés a bien ete crée ")
            else
                render :new
            end
        end

        def destroy
            
            @specie.destroy
            redirect_to({action: :index}, success: "L'especés a bien ete Supprimée ")

        end

        
        def edit
        end

        def update

            if @species.update(species_params)

                redirect_to({action: :index}, success: "L'especés a bien ete Modifiée ")
            else
                render :new
            end

        end




        private

        def species_params
            params.require(:specie).permit(:slug, :name, :questionone, :questiontwo, :questionthree)

        end

        def set_species
            @species = Specie.find(params[:id])
        end



    end

end
