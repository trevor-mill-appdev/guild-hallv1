class UsersController < ApplicationController
  def inbox
    render({ :template => "inbox/show.html.erb"})
  end
end