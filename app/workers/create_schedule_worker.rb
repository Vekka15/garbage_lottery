class CreateScheduleWorker < AssignationsController
  include Sidekiq::Worker

  def perform
    all_users = User.all
    all_invitations = Invitation.all
    all_assignations = Assignation.all
    all_members = all_users.size + all_invitations.size
    today = Date.today
    # for now only for test normaly today + time
    week_start = today.at_beginning_of_week
    # delete all old assignments
    unless all_assignations.empty?
      all_assignations.destroy_all
    end
    # create new assignments
    7.times do |n|
      chosen = rand(0..all_members - 1)
      assignation = Assignation.new
      # create assignment for existing user
      if chosen < all_users.size
        assignation.user_mail = all_users[chosen].email
      else # create assignment for invited user but not accepted
        invitation_number = all_members - chosen - 1
        assignation.user_mail = all_invitations[invitation_number].email
      end
      assignation.update_attributes(day: week_start + n)
      assignation.save
    end
  end
end
