class AddCandidateRefToJoboffers < ActiveRecord::Migration[6.0]
  def change
    add_reference :joboffers, :candidate, foreign_key: true
  end
end
