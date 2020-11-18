class JoboffersController < ApplicationController
  before_action :set_joboffer, only: [:show, :edit, :update, :destroy]
  impressionist :actions=>[:show]

  # GET /joboffers
  # GET /joboffers.json
  def index
    @joboffers = Joboffer.all.order(created_at: :DESC)
  end

  # GET /joboffers/1
  # GET /joboffers/1.json
  def show
    impressionist @joboffer
  end

  # GET /joboffers/new
  def new
    @joboffer = Joboffer.new
  end

  # GET /joboffers/1/edit
  def edit
  end

  # POST /joboffers
  # POST /joboffers.json
  def create
    @joboffer = Joboffer.new(joboffer_params)

    respond_to do |format|
      if @joboffer.save
        format.html { redirect_to @joboffer, notice: 'Joboffer was successfully created.' }
        format.json { render :show, status: :created, location: @joboffer }
      else
        format.html { render :new }
        format.json { render json: @joboffer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /joboffers/1
  # PATCH/PUT /joboffers/1.json
  def update
    respond_to do |format|
      if @joboffer.update(joboffer_params)
        format.html { redirect_to @joboffer, notice: 'Joboffer was successfully updated.' }
        format.json { render :show, status: :ok, location: @joboffer }
      else
        format.html { render :edit }
        format.json { render json: @joboffer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joboffers/1
  # DELETE /joboffers/1.json
  def destroy
    @joboffer.destroy
    respond_to do |format|
      format.html { redirect_to joboffers_url, notice: 'Joboffer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joboffer
      @joboffer = Joboffer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def joboffer_params
      params.require(:joboffer).permit(:title, :description)
    end
end
