class ShortenersController < ApplicationController
  before_action :set_shortener, only: [:show, :destroy]

  # GET /shorteners
  # GET /shorteners.json
  def index
    @shorteners = Shortener.all.order(updated_at: :desc).page(params[:page]).per(10)
  end

  # GET /shorteners/new
  def new
    @shortener = Shortener.new
  end

  # POST /shorteners
  # POST /shorteners.json
  def create
    unless params[:shortener][:main_domain].blank?
      @shortener = Shortener.abbreviate_url(params[:shortener][:main_domain])

      if @shortener.save
        redirect_to root_path, notice: 'Shortener was successfully created.'
      else
        redirect_to root_path, alert: "#{@shortener.errors.full_messages.join(', ')}"
      end
    else
      redirect_to root_path, alert: "URL can't be blank."
    end
  end

  # DELETE /shorteners/1
  # DELETE /shorteners/1.json
  def destroy
    @shortener.destroy
    redirect_to shorteners_url, notice: 'Shortener was successfully removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shortener
      @shortener = Shortener.find(params[:id])
    end
end
