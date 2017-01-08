class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_filter :check_admin
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
      redirect_to admin_jobs_path, notice: 'Create a job!'
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
      redirect_to admin_jobs_path, notice: 'Update Success!'
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      redirect_to admin_jobs_path, alert: 'Job Deleted!'
    end
  end


  private
  def job_params
    params.require(:job).permit(:title, :content, :wage_min, :wage_max, :contact, :is_hidden)
  end
  def check_admin
    if !current_user.admin?
      redirect_to root_path, alert: 'You are not admin!'
    end
  end



end
