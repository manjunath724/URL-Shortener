class ShortenersController < ApplicationController
  before_action :set_shortener, only: [:show, :destroy]

  # GET /shorteners
  # GET /shorteners.json
  def index
    @shorteners = Shortener.all
  end

  # GET /shorteners/new
  def new
    @shortener = Shortener.new
  end

  # POST /shorteners
  # POST /shorteners.json
  def create
    @shortener = Shortener.abbreviate_url(params[:shortener][:main_domain])

    if @shortener.save
      redirect_to @shortener, notice: 'Shortener was successfully created.'
    else
      render :new
    end
  end

  # DELETE /shorteners/1
  # DELETE /shorteners/1.json
  def destroy
    @shortener.destroy
    redirect_to shorteners_url, notice: 'Shortener was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shortener
      @shortener = Shortener.find(params[:id])
    end
end
