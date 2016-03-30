class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email,
    format: { with: /\w\@prograils.com/, message: 'Not proper format', allow_blank: true }

  validate :check_password_confirmation

  def check_password_confirmation
    errors.add(:password, " confirmation != password") if password_confirmation != password
  end
end
