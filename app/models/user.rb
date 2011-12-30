class User < ActiveRecord::Base
  has_many :jobs, :dependent => :restrict
  has_many :drives, :dependent => :restrict
  has_many :items, :dependent => :restrict
  has_many :products, :dependent => :restrict
  has_many :apartments, :dependent => :restrict
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
    end
  end
end
