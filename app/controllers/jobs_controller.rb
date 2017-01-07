class JobsController < ApplicationController
  def index
    @jobs = Job.all
    flash[:notice] = 'hello'
  end
end
