require 'user.rb'

class JobsController < ApplicationController
  def index
    @jobs = Job.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  end

  def show
    @job = Job.find(params[:id])
    
    @job.counter += 1;
    @job.update_attributes(params[:job])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])
    @job.counter = 0
    @job.user_id = 1 #session[:user_id];

    if @job.save
      redirect_to @job, notice: 'Job wurde erfolgreich gespeichert!'
    else
      render action: "new"
    end
  end
end
