# coding: UTF-8

require 'user.rb'

class JobsController < ApplicationController
  add_breadcrumb 'Jobbörse', '/jobs'
  
  def index    
    condition = ""
    condition_composition = ""
  
    if params[:filter] != "" && params[:filter] != nil
      if params[:filter] == "t"
        condition += "offer_or_quest = '1' OR offer_or_quest = 't'"
        add_breadcrumb 'Biete', jobs_path + '?filter=t'
      else
        condition += "offer_or_quest = '0' OR offer_or_quest = 'f'"
        add_breadcrumb 'Suche', jobs_path + '?filter=f'
      end
      condition_composition = " AND "
    end
    
    if params[:service] != "" && params[:service] != nil
      if params[:service] == "Freiwillig"
        condition += condition_composition + "paid = '0' OR paid = 'f'"
      else
        condition += condition_composition + "employment_status = '" + params[:service] + "'"
      end
      add_breadcrumb params[:service], jobs_path + '?service=' + params[:service]
    end

    if condition != ""
      @jobs = Job.where(condition).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    else
      @jobs = Job.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    end 
  end

  def show
    @job = Job.find(params[:id])
    
    if @job.offer_or_quest
      add_breadcrumb 'Biete', jobs_path + '?filter=t'
    else
      add_breadcrumb 'Suche', jobs_path + '?filter=f'
    end
    add_breadcrumb @job.title, job_path
    
    @job.counter += 1;
    @job.update_attribute(:counter, @job.counter)
  end

  def new
    @job = Job.new
    add_breadcrumb 'Anzeige hinzufügen', new_job_path
  end

  def create
    @job = Job.new(params[:job])
    @job.counter = 0
    @job.user_id = session[:user_id]
    @job.module = "job"

    if @job.save
      redirect_to @job, notice: 'Anzeige wurde erfolgreich hinzugefügt!'
    else
      render action: "new"
    end
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, :notice => 'Anzeige wurde erfolgreich gelöscht!'
  end
  
  def filter
  end
  
  def service
  end
  
  def remove_old_articles
    post_ids = Job.find(:all, :conditions => ["created_at < ?", 60.days.ago])
    puts "Aktualisiert am" + Time.now
    if post_ids.size > 0
      Item.destroy(post_ids)
    end
  end
end
