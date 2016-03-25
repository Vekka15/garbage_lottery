class Invitation < ActiveRecord::Base
  validates :email,
    presence: {message: 'Email is required'},
    uniqueness: {message: 'Invitation with this email already exist'},
    format: { with: /\w\@prograils.com/, message: 'Not proper format'},
    email: true



  # private
  # def unique_user
  #   unless User.where(email: self.email).empty?
  #     record.errors[:email] << 'User with this email already exist'
  #   end
  # end
end
