class Assignation < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_mail'
  belongs_to :invitation, foreign_key: 'user_mail'
end
