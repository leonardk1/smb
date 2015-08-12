class Role < ActiveRecord::Base
	has_many :contacts
	validates :name, presence: true
end
