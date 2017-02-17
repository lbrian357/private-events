class RemoveAttendedEventsAttendeesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :attended_events_attendees
  end
end
