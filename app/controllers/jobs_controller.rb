require 'user.rb'

class JobsController < ApplicationController
  def index
    @jobs = Job.paginate(:page => params[:page], :per_page => 2).order('created_at DESC')
  end

  def show
    @job = Job.find(params[:id])
    
    @job.counter += 1;
    @job.update_attributes(params[:job])
    
    if @job.paid == false
      @paid = "Freiwillig"
    else
      @paid = "Bezahlte Arbeit"
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])
    @job.counter = 0;   
    @job.user_id = session[:user_id];

    if @job.save
      redirect_to @job, notice: 'Job wurde erfolgreich gespeichert!'
    else
      render action: "new"
    end
  end
end
