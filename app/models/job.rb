class Job < ApplicationRecord
  belongs_to :user
  has_many :resumes
  has_many :favourite_jobs
  has_many :collectors, through: :favourite_jobs, source: :user
  validates :title,presence: true
  validates :wage_min, numericality: { greater_than: 0}
  validates :wage_max, numericality: { greater_than: 0}
  scope :hidden, -> {where(:is_hidden => false)}

end
