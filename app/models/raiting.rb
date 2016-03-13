class Raiting < ActiveRecord::Base
	belongs_to :charger
	belongs_to :user
end
