class SubsController < ApplicationController


    before_action :require_logged_in, except: [:index, :show]
    before_action :require_user_owned_sub, only: [:edit, :update]

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = current_user.subs.new(sub_params)
        # @sub.moderator_id = params[:moderator_id]
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def index
        @subs = Sub.all
        render :index
    end

    def require_user_owned_sub
        owned_sub = current_user.subs.find_by(id: params[:id])
        if !owned_sub
            render json: "not your sub"
        end
    end

    def sub_params
        params.require(:sub).permit(:title, :description)
    end


    
end
