class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :jobs
  has_many :resumes
  has_many :favourite_jobs
  has_many :love_jobs, :through => :favourite_jobs, :source => :job
  def admin?
    is_admin?
  end

  def is_in_collection?(job)
    love_jobs.include?(job)
  end

  def add_to_collection!(job)
    love_jobs << job
  end

  def cancel_from_collection!(job)
    love_jobs.delete(job)
  end

end
