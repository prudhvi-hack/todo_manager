class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render plain: User.all.map { |user| user.to_displayable_string }.join("\n")
  end

  def new
  end

  def create
    user = User.add_newuser(params)
    session[:current_user_id] = user.id
    redirect_to "/"
  end

  def check
    render plain: User.check(params)
  end
end
