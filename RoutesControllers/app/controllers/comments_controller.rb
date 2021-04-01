class CommentsController < ApplicationController

    def index
        if params[:user_id]
            user_comments = User.find(params[:user_id]).comments
            render json: user_comments
        elsif params[:artwork_id]
            artwork_comments = Artwork.find(params[:artwork_id]).comments
            render json: artwork_comments
        else
            comments = Comment.all
            render json: comments
        end
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: comment
    end


    private
    def comment_params
        params.require(:comment).permit(:body, :artwork_id, :author_id)
    end
end