class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'

  has_many :attendanceships#, foreign_key: 'user_id'
  has_many :attended_events, through: :attendanceships, source: :attended_event
  has_many :invitations
  has_many :invited_events, through: :invitations, source: :invited_event

  validates :email, presence: true,
                    uniqueness: true


  def upcoming_events
    self.attended_events.where("time > :now_time", {now_time: Time.now}) 
  end

  def previous_events
    self.attended_events.where("time <= :now_time", {now_time: Time.now})
  end
end
