class AddUserRefToJoboffers < ActiveRecord::Migration[6.0]
  def change
    add_reference :joboffers, :user, foreign_key: true
  end
end
