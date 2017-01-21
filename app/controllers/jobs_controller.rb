class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result.hidden.includes(:user).paginate(:page => params[:page], :per_page => 5)
    # @jobs = case params[:order]
    # when 'by_wage_min' then @q.result.hidden.order('wage_min DESC')
    # when 'by_wage_max' then @q.result.hidden.order('wage_max DESC')
    # when 'by_updated_at' then @q.result.hidden.order('updated_at DESC')
    # else
    #   @q.result.hidden.order('created_at DESC')
    # end
    respond_to do |format|
        format.html # index.html.erb
        # format.json { render json: @jobs }
    end
  end

  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      redirect_to jobs_path, alert: 'This job already archieved!'
    end
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
    params.require(:job).permit(:title, :content, :wage_min, :wage_max, :contact, :is_hidden, :location)
  end

  def check_user
    @job = Job.find(params[:id])
    if current_user != @job.user
      redirect_to jobs_path, warning: 'You have no permission!'
    end
  end
end
