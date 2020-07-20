class PostsController < ApplicationController

    before_action :require_logged_in, except: [:show]
    before_action :require_user_owned_post, only: [:edit, :update, :destroy]

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :edit
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            redirect_to sub_url(@post.sub.id)
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    # def index
    #     @post = Post.all
    #     render :index
    # end
    

    def require_user_owned_post
        owned_post = current_user.posts.find_by(id: params[:id])
        if !owned_post
            render json: "not your post"
        end
    end

    def post_params
        params.require(:post).permit(:title, :content, :sub_id)
    end
    
end
