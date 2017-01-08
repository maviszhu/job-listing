class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
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
    @job.user = current_user
    if @job.save
      redirect_to jobs_path, notice: 'Create a job!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: 'Update Success!'
    else
      render :edit
    end
  end

  def destroy
    if @job.destroy
      redirect_to jobs_path, alert: 'Job Deleted!'
    end
  end


  private
  def job_params
    params.require(:job).permit(:title, :content, :wage_min, :wage_max, :contact, :is_hidden)
  end

  def check_user
    @job = Job.find(params[:id])
    if current_user != @job.user
      redirect_to jobs_path, warning: 'You have no permission!'
    end
  end
end
