class UsersController < ApplicationController

    def index
    #     # @users = User.all 
    #     # render json: @users
        render plain: "I'm in the index action!"
    end

    def create
        # @user = User.new
        render json: params
    end

    def show
        # @user = User.find(params[:id])
        render json: params
    end

    # def user_params
    #     params.require(:user).permit()
    # end

    


end
