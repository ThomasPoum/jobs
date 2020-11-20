class Joboffer < ApplicationRecord
  is_impressionable counter_cache: true

  has_many :candidates, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  
end
