class BogsController < ApplicationController
		def index
			@creatures = Creature.all
			render :index
		end
		def new
			render :new
		end
		def create
			  new_creature = params.require(:creature).permit(:name, :description)
    		@new_creature = Creature.create(new_creature)
    		redirect_to "/bogs/#{@new_creature.id}"
    end

    def show
    	creature_id = params[:id]
    	@creature = Creature.find(creature_id)
    	render :show
    end

		def edit
        creature_id = params[:id]
        @creature = Creature.find(creature_id)
        render :edit
		end

		def update
				creature_id = params[:id]
				creature = Creature.find(creature_id)
				updated_attributes = params.require(:creature).permit(:name, :description)
				Creature.update(creature, updated_attributes)
				redirect_to "/bogs/#{creature_id}"
		end

		def delete
				puts "I am in delete"
				@creature = Creature.find(params[:id])
				Creature.destroy(@creature)
				redirect_to "/bogs"
				#updated_attributes = params.require(:creature).permit(:name, :description)
				# Creature.delete(creature)
				# redirect_to '/bogs'
		end

end