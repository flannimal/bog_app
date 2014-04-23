class BogsController < ApplicationController
	
	def index
		@creatures = Creature.all
		render :index
	end

	def new
		render :new
	end

	def list
		@creatures = Creature.all
		render :list
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
			creature = Creature.find(creature_id)			# @creature = fail
			updated_attributes = params.require(:creature).permit(:name, :description)
			Creature.update(creature, updated_attributes)     #what did the 2nd argument (nil) do in create method?
			redirect_to "/bogs/#{creature_id}"
	end

	def delete
			@creature = Creature.find(params[:id])
			Creature.destroy(@creature)					# destory is an active record method, not rails or sql...?
			redirect_to "/bogs"
	end

end