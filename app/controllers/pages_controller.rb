class PagesController < ApplicationController

  def home
    @title = "Minutes Left Coming Soon"
  end

  def music
    @title = "Minutes Left Coming Soon"
  end

  def contact
    @title = "Contact"
    @message = Message.new
  end
end
