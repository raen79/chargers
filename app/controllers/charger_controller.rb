class ChargerController < ApplicationController
  require 'net/http'

  def home
    xml_content = Net::HTTP.get(URI.parse('http://api.openchargemap.io/v2/poi/?output=kml&countrycode=SE&maxresults=500'))
    chargers = Hash.from_xml(xml_content)
    chargers['kml']['Document']['Placemark'].each do |charger|
      new_charger = CommercialCharger.new(:name => charger['name'], :description => charger['description'], :coordinates => charger['Point']['coordinates'])
      new_charger.save
    end
    @commercial_chargers = CommercialCharger.all
    @chargers = Charger.all
  end

  def all_chargers
  	@chargers = Charger.all.order(created_at: :desc)
  end

  def my_chargers
  	@chargers = current_user.chargers.all.order(created_at: :desc)
  end

  def new_charger
  	@charger = current_user.chargers.new
  end

  def create_charger
  	@charger = current_user.chargers.new(charger_params)
  	if @charger.save
  		redirect_to :my_chargers
  	else
  		render 'new_charger'
  	end
  end

  def view_charger
  	@charger = current_user.chargers.find(params[:id])
  end

  def edit_charger
  	@charger = current_user.chargers.find(params[:id])
  end

  def update_charger
  	@charger = Charger.find(params[:id])
  	if @charger.update(charger_params)
  		redirect_to :charger
  	else
  		render 'view_charger'
  	end
  end

  def delete_charger
  	@charger = Charger.find(params[:id])
  	if @charger.destroy
  		redirect_to :my_chargers
  	else
  		render 'view_charger'
  	end
  end


  def login_signup
  	if user_signed_in?
  		redirect_to :root
  	end
  end

  private

		def charger_params
			params.require(:charger).permit(:price, :location, :phone, :charger_type)
		end
end