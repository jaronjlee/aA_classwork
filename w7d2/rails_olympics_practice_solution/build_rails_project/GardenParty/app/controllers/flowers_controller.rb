class FlowersController < ApplicationController

    def create
        @flower = Flower.new(flower_params)
        @flower.save
        redirect_to garden_url(@flower.garden_id)
    end

    def destroy
        flower = Flower.find_by(id: params[:id])
        garden_id = flower.garden_id
        flower.destroy
        redirect_to garden_url(garden_id)
    end

    def flower_params
        params.require(:flower).permit(:flower_type, :garden_id, :gardener_id)
    end
end
