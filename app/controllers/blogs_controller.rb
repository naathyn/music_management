class BlogsController < ApplicationController
  before_filter :admin_user, except: [:index, :show]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @title = "Sam Raines's Writings"
    @blogs = Blog.page(params[:page])
  end

  def show
  end

  def new
    @blog = Blog.new
    @title = "New Blog Entry - #{Time.now.to_s(:long_ordinal).gsub(/\d+:\d+/, '')}"
  end

  def edit
    @title = "Editing #{@blog.title} on #{Time.now.to_s(:long_ordinal).gsub(/\d+:\d+/, '')}"
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to entry_path(@blog), notice: 'Your entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blog }
      else
        @title = "Please try again"
        format.html { render action: 'new' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to entry_path(@blog), notice: 'Your entry was successfully updated.' }
        format.json { head :no_content }
      else
        @title = "Please try again"
        format.html { render action: 'edit' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to :blogs }
      format.json { head :no_content }
    end
  end

  private

    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
