class CandidatesController < ApplicationController
  before_action :set_joboffer, only: [:new, :create]
  before_action :set_candidate, only: :show

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.create(candidate_params)
    session[:session_candidate_id] = @candidate.id
    session[:email] = @candidate.email
    session[:resume_name] = request.params.values

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @joboffer, notice: 'You applied to this job' }
      else
        format.html { redirect_to @joboffer, alert: 'A problem was detected during your apply' }
      end
    end

  end

  def show
  end

  def index
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  # Only allow a list of trusted parameters through.
  def candidate_params
    params.require(:candidate).permit(:email, :resume, :joboffer_id)
  end

  def set_joboffer
    @joboffer = Joboffer.find_by(params[:id])
  end

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end


end
