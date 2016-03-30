class AssignationsController < ApplicationController
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @begin = Time.now.in_time_zone('Poland').to_date.at_beginning_of_week
    end
  end

  def restart
    if current_user.admin==true
      CreateScheduleWorker.new.perform
      redirect_to root_path
    end
  end
end
