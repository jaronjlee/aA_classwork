class CommentsController < ApplicationController

    def create
        comment = Comment.create(params.require(:comment).permit(:body, :author_id, :blog_id))
        if comment.save
            redirect_to blog_url(comment.blog_id)
        else
            redirect_to blog_url(comment.blog_id)
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to blog_url(comment.blog_id)
    end
    
end
