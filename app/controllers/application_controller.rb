class ApplicationController < ActionController::Base

  

  def search
    q = params[:q]
    @jobs_results  = Joboffer.ransack(title_cont: q).result
  end



end
