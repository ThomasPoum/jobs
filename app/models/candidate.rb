class Candidate < ApplicationRecord

  has_many :joboffers

  validates :email, presence: true
  validates :resume, presence: true
  
end
