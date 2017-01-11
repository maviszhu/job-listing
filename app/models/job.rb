class Job < ApplicationRecord
  has_many :resumes
  validates :title,presence: true
  validates :wage_min,presence: true
  validates :wage_max,presence: true
  validates :wage_min,numericality: {greater_than: 0}
  validates :wage_max,numericality: {greater_than: 0}
  scope :recent, -> {order('updated_at DESC')}
  def publish!
    self.is_hidden = false
    self.save
  end
  def hide!
    self.is_hidden = true
    self.save
  end

  def resume_user_count
    s = []
    self.resumes.each do |resume|
      s.push(resume.user)
    end
    return s.uniq.length
  end

  def resume_count
    self.resumes.count
  end


end
