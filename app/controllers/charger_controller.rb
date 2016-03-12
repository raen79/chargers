class ChargerController < ApplicationController
  #require 'net/http'

  def home
    #xml_content = Net::HTTP.get(URI.parse('http://api.openchargemap.io/v2/poi/?output=kml&countrycode=US'))
    #chargers = Hash.from_xml(xml_content)
    #chargers['kml']['Document']['Placemark'].each do |charger|
    #  new_charger = CommercialCharger.new(:name => charger['name'], :description => charger['description'], :coordinates => charger['Point']['coordinates'])
    #  new_charger.save
    #end
    @commercial_chargers = CommercialCharger.all
  end
end