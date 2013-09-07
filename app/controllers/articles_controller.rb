class ArticlesController < ApplicationController
  before_filter :admin_user, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @title = "News"
    @articles = Article.page(params[:page])
  end

  def show
    @title = @article.content
  end

  def new
    @article = Article.new
    @title = "New Article"
  end

  def edit
    @title = "Editing Article"
  end

  def create
    @article = Article.new(article_params)
    @articles = Article.page(params[:page])

    respond_to do |format|
      if @article.save
        format.json { render action: 'show', status: :created, location: @article }
        format.js
      else
        format.json { render json: @article.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @article.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @articles = Article.page(params[:page])
    @article.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:content, :published)
    end
end
