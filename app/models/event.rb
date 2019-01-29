class Event < ApplicationRecord
	has_many :attendances, :foreign_key => "attended_event_id"
	has_many :attendees, through: :attendances
	belongs_to :creator, :class_name => "User"
	validates :date, presence: true

	scope :past, -> { where("date < ?", Date.today) }
	scope :upcoming, -> { where("date >= ?", Date.today) } 
end
