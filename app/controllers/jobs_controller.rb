class JobsController < ApplicationController
  def index
    @jobs = Job.limit(5).order('id DESC')
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
    @job.counter = 0;   
    @job.user_id = 1;

    @job.type = params[:type]
    
    @job.offer_or_quest = params[:type]
    @job.paid = params[:paid]
    @job.save

    # @user = User.create()
    # @user.title = 'Frau'
    # @user.forename = 'Muster'
    # @user.lastname = 'Frau'
    # @user.save
    
    redirect_to jobs_path
  end
end
