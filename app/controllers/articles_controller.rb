require 'user.rb'

class ArticlesController < ApplicationController
  def index
    @articles = Article.limit(5).order('id DESC')
    
  end

  def show
  end

  def delete
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    @article.save
    @user = User.create()
    @user.title = 'Frau'
    @user.forename = 'Muster'
    @user.lastname = 'Frau'
    @user.save
    redirect_to articles_path
  end

end
