class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_displayable_string }.join("\n")
  end

  def create
    user = User.add_newuser(params)
    render plain: "a user created with id #{user.id}"
  end

  def check
    render plain: User.check(params)
  end
end
