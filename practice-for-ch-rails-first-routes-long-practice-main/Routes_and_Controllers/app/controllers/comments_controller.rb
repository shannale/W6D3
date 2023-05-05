class CommentsController < ApplicationController
    def index 
        if params[:user_id]
            @comments = Comment.where(author_id: params[:user_id])
        elsif params[:artwork_id]
            @comments = Comment.where(artwork_id: params[:artwork_id])
        else  
            puts 'no'
        end

        render json: @comments
    end 

    def create 
        @comment = Comment.new(comment_params)
        if @comment.save 
            render json: @comment
        else 
            render json @comment.errors.full_messages, status: :unprocessable_entity
        end
    end 

    def destroy 
    end 


    private 

    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body)
    end 
end
