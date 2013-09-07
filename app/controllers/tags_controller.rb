class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @blogs = @tag.blogs.page(params[:page])
  end
end
