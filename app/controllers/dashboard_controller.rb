class DashboardController < ApplicationController
  def index
    @user = GithubUser.get_user_data(current_user.token)
  end
end
