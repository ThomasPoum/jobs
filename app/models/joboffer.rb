class Joboffer < ApplicationRecord
  is_impressionable counter_cache: true

  has_many :candidates
end
