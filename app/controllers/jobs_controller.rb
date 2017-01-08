class JobsController < ApplicationController
  def index
    @jobs = Job.all.order('updated_at DESC')
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path, notice: 'Create a job!'
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path, notice: 'Update Success!'
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      redirect_to jobs_path, alert: 'Job Deleted!'
    end
  end




  private
  def job_params
    params.require(:job).permit(:title, :content, :wage_min, :wage_max, :contact, :is_hidden)
  end
end
