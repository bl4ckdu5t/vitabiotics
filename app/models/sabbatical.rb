class Sabbatical < ActiveRecord::Base
	belongs_to :staff
	validates :staff_id, presence: true
end
