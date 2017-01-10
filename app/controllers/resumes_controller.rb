class ResumesController < ApplicationController
  before_action :authenticate_user!
  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes
  end
  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.user = current_user
    @resume.job = @job
    if @resume.save
      redirect_to root_path, notice: 'Resume Added!'
    else
      render :new
    end
  end

private
def resume_params
  params.require(:resume).permit(:user_id, :job_id, :content, :attachment)
end


end
