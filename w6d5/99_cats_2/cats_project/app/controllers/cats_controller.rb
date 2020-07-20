class CatsController < ApplicationController

    def new
        @cat = Cat.new
        render :new
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            flash.now[:errors] = @cat.errors.full_messages
            render :new
        end
    end

    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end

    def update
        @cat = Cat.find(params[:id])
        if @cat.update_attributes(cat_params)
          redirect_to cat_url(@cat)
        else
          flash[:errors] = ["error message"]
          render :edit
        end
    end

    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    private

    def cat_params
        params.require(:cat).permit(:age, :color, :name)
    end

end
