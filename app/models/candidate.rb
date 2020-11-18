class Candidate < ApplicationRecord
  mount_uploader :resume, CvUploader

  has_many :joboffers
  
end
