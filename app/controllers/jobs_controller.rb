require 'user.rb'

class JobsController < ApplicationController
  def index
    condition = ""
    condition_composition = ""
  
    if params[:filter] != "" && params[:filter] != nil
      condition += "offer_or_quest = '" + params[:filter] + "'"
      condition_composition = " AND "
    end
    if params[:service] != "" && params[:service] != nil
      condition += condition_composition + "employment_status = '" + params[:service] + "'"
    end

    if condition != ""
      @jobs = Job.where(condition).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    else
      @jobs = Job.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    end
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
    @job.user_id = 1 #session[:user_id]

    if @job.save
      redirect_to @job, notice: 'Job wurde erfolgreich gespeichert!'
    else
      render action: "new"
    end
  end
  
  def filter
  end
  
  def service
  end
end
