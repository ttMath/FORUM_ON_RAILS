class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = current_user
       @posts = @user.post

    end
    
end