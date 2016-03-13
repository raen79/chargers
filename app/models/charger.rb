class Charger < ActiveRecord::Base
	belongs_to :user
	has_many :raitings
end