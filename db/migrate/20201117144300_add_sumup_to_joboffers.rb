class AddSumupToJoboffers < ActiveRecord::Migration[6.0]
  def change
    add_column :joboffers, :sumup, :text
  end
end
