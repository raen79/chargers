class Raiting < ActiveRecord::Base
	belongs_to :charger
	belongs_to :user
	belongs_to :commercial_charger
end
