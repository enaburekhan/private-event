class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id' 
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
