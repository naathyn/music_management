class ShowsController < ApplicationController
  before_filter :admin_user, except: :index
  before_action :set_show, only: [:show, :edit, :update, :destroy]

  def index
    @title = "Shows"
    @shows = Show.page(params[:page])
  end

  def show
  end

  def new
    @show = Show.new
    @title = "New Show"
  end

  def edit
    @title = "Editing #{@show.venue}"
  end

  def create
    @show = Show.new(show_params)

    date = params[:date]
    year = date[:year].to_i
    month = date[:month].to_i
    day = date[:day].to_i
    hour = date[:hour].to_i
    minute = date[:minute].to_i

    @show.date = DateTime.civil(year, month, day, hour, minute)

    respond_to do |format|
      if @show.save
        format.html { redirect_to :shows, notice: 'Show was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show }
      else
        format.html { render action: 'new' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to :shows, notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to :shows }
      format.json { head :no_content }
    end
  end

  private

    def set_show
      @show = Show.find(params[:id])
    end

    def show_params
      params.require(:show).permit({:date => []}, :venue, :address, :price)
    end
end
