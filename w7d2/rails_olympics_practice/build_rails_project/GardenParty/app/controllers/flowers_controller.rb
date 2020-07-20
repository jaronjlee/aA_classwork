class FlowersController < ApplicationController

    def create
        @flower = Flower.new(flower_params)
        if @flower.save
            redirect_to garden_url(@flower.garden_id)
        else
            redirect_to garden_url(@flower.garden_id)
        end
    end

    def destroy
        flower = Flower.find(params[:id])
        flower.destroy
        redirect_to garden_url(flower.garden_id)

    end

    private

    def flower_params
        params.require(:flower).permit(:flower_type, :garden_id, :gardener_id)
    end
end
