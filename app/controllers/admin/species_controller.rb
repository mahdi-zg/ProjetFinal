module Admin

    class SpeciesController < ApplicationController

        before_action :set_species, only: [:update, :edit, :destroy]

        def index
                @species = Species.all
        end

        def new 
            @species = Species.new
        end

        def create
            @species = Species.new(species_params)
            if @species.save

                redirect_to({action: :index}, success: "L'especés a bien ete crée ")
            else
                render :new
            end
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

        def destroy
            @species.destroy
            redirect_to({action: :index}, success: "L'especés a bien ete Supprimée ")


        end



        private

        def species_params
            params.require(:species).permit(:slug, :name)

        end

        def set_species
            @species = Species.find(params[:id])
        end



    end

end
