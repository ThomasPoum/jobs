class JoboffersController < ApplicationController
  before_action :set_joboffer, only: [:show, :edit, :update, :destroy, :apply]
  impressionist :actions=>[:show]

  # GET /joboffers
  # GET /joboffers.json
  def index
    @joboffers = Joboffer.all.order(created_at: :DESC)
  end

  # GET /joboffers/1
  # GET /joboffers/1.json
  def show
    @candidate = Candidate.new
    @candidate.email = session[:email]
    @candidate.resume = session[:resume]
    params[:candidate_id] = session[:session_candidate_id]
    
    if session[:view_id]
        session[:view_id].push(@joboffer.id).uniq!
    else
      session[:view_id] = [@joboffer.id]
    end
  
  end

  def apply
    
    @joboffer.update(joboffer_params)
    
    redirect_to root_path

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
    @joboffer.user_id = current_user.id

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
      params.require(:joboffer).permit(:title, :description, :candidate_id)
    end
end
