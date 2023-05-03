class UsersController < ApplicationController

    def index
        # @users = User.all 
        # render json: @users
        puts "hello" 
    end

    def create
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    # def user_params
    #     params.require(:user).permit()
    # end

    


end
