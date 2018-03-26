class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @parks = current_user.parks.all
  end
end
