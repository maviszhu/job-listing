class Account::JobsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @jobs = current_user.love_jobs.paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')
  end
end
