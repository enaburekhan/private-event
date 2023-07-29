class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id' 
  has_many :attendances, dependent: :destroy, foreign_key: 'attended_event_id'
  has_many :invited_users, through: :attendances, source: :attendee, class_name: 'User'
  # has_many :attendees, through: :attendances, source: :user

  validates :date, presence: true

  scope :past, -> { where('date < ?', Date.current) }

  scope :upcoming, -> { where('date >= ?', Date.current) }
end
