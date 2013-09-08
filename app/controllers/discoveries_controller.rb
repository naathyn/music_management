class DiscoveriesController < ApplicationController
  before_filter :admin_user, except: [:index, :show]
  before_filter :increment_view_count, only: :show
  before_action :set_discovery, only: [:show, :edit, :update, :destroy]

  def index
    @title = "Discovered Artists"
    @discoveries = Discovery.page(params[:page])
  end

  def show
    @title = @discovery.person
  end

  def new
    @discovery = Discovery.new
    @title = "New Discovery"
  end

  def edit
    @title = "Editing #{@discovery.title} - #{@discovery.title}"
  end

  def create
    @discovery = Discovery.new(discovery_params)

    respond_to do |format|
      if @discovery.save
        format.html { redirect_to @discovery, notice: 'Discovery was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discovery }
      else
        format.html { render action: 'new' }
        format.json { render json: @discovery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @discovery.update(discovery_params)
        format.html { redirect_to @discovery, notice: 'Discovery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @discovery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @discovery.destroy
    respond_to do |format|
      format.html { redirect_to :main_discover }
      format.json { head :no_content }
    end
  end

  private

    def set_discovery
      @discovery = Discovery.friendly.find(params[:id])
    end

    def discovery_params
      params.require(:discovery).permit(:title, :person, :content, :thumbnail)
    end

    def increment_view_count
      unless signed_in?
        @discovery = Discovery.friendly.find(params[:id])
        @discovery.increment!(:views)
      end
    end
end
