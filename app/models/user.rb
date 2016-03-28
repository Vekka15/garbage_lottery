class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :admin_add
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
