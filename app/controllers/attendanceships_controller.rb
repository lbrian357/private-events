class AttendanceshipsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    attendance = event.attendanceships.build(user_id: current_user.id)
    if attendance.save
      flash[:success] = "You've sucessfully RSVPed to #{event.name}"
      redirect_to event
    else
      flash[:danger] = "You were not be added to the attandance list: #{attendance.errors.full_messages}"
      redirect_to event
    end
  end
end
