class Invitation < ActiveRecord::Base
  validates :email,
    presence: { message: 'Email is required' },
    uniqueness: {message: 'Invitation with this email already exist'},
    format: { with: /\w\@prograils.com/, message: 'Not proper format', allow_blank: true},
    email: true

end
