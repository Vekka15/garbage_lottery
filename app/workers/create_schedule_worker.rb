class CreateScheduleWorker < AssignationsController
  include Sidekiq::Worker

  def perform
    puts "dziala"
    all_users = User.all
    all_invitations = Invitation.all
    all_members = all_users.size + all_invitations.size
    today = Date.today
    # for now only for test normaly today + time
    week_start = today.at_beginning_of_week
    7.times do |n|
      chosen = rand(0..all_members - 1)
      assignation = Assignation.new
      assignation.user_id = all_users[chosen].id
      assignation.update_attributes(day: week_start + n.days)
      assignation.save
    end

  end
end
