class User < ActiveRecord::Base
  has_many :jobs, :dependent => :restrict
  has_many :drives, :dependent => :restrict
  has_many :items, :dependent => :restrict
  has_many :products, :dependent => :restrict
  has_many :apartments, :dependent => :restrict
end
