class CandidatesController < ApplicationController


  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to root_path, notice: 'candidate was successfully created.' }
      else
        format.html { redirect_to root_path, alert: 'candidate was not successfully created.' }
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


end
