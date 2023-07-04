class Api::UsersController < ApplicationController
    def index
      users = User.all
      response.headers['Cache-Control'] = 'no-cache, no-store'
      response.headers['Pragma'] = 'no-cache'
      response.headers['Expires'] = '0'
      render json: users
    end
end