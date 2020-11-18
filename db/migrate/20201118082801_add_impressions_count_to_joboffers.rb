class AddImpressionsCountToJoboffers < ActiveRecord::Migration[6.0]
  def change
    add_column :joboffers, :impressions_count, :integer
  end
end
