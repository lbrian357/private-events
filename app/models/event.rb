class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :attendanceships#, foreign_key: 'event_id'
  has_many :attendees, through: :attendanceships, source: :attendee
  has_many :invitations
  has_many :invitees, through: :invitations

  scope :previous, -> { where("time <= :now_time", {now_time: Time.now}) }
  scope :upcoming, -> { where("time > :now_time", {now_time: Time.now}) }
  # Replaced with scope
    #def self.previous
    #  Event.all.where("time <= :now_time", {now_time: Time.now})
    #end

    #def self.upcoming
    #  Event.all.where("time > :now_time", {now_time: Time.now})
    #end

  

end
