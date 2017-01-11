class Job < ApplicationRecord
  belongs_to :user
  has_many :resumes
  validates :title,presence: true
  validates :wage_min, numericality: { greater_than: 0}
  validates :wage_max, numericality: { greater_than: 0}

end
