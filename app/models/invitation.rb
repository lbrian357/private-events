class Invitation < ApplicationRecord
  attr_accessor :user_name
  belongs_to :invited_event, class_name: 'Event', foreign_key: 'event_id'
  belongs_to :invitee, class_name: 'User', foreign_key: 'user_id'

  validates_uniqueness_of :user_id, scope: :event_id
end
