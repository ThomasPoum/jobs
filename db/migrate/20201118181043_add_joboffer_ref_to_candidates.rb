class AddJobofferRefToCandidates < ActiveRecord::Migration[6.0]
  def change
    add_reference :candidates, :joboffer, foreign_key: true
  end
end
