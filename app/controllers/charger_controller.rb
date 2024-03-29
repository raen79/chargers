class ChargerController < ApplicationController
  #require 'net/http'

  def home
    #xml_content = Net::HTTP.get(URI.parse('http://api.openchargemap.io/v2/poi/?output=kml&countrycode=SE&maxresults=500'))
    #chargers = Hash.from_xml(xml_content)
    #chargers['kml']['Document']['Placemark'].each do |charger|
    #  new_charger = CommercialCharger.new(:name => charger['name'], :description => charger['description'], :coordinates => charger['Point']['coordinates'])
    #  new_charger.save
    #end
    @commercial_chargers = CommercialCharger.all
    @chargers = Charger.all
  end

  #ALL ABOUT CHARGERS

  def all_chargers
  	@chargers = Charger.all.order(created_at: :desc)
  end

  def my_chargers
  	if !user_signed_in?
  		redirect_to :login_signup
  	end
  	@chargers = current_user.chargers.all.order(created_at: :desc)
  end

  def new_charger
  	if !user_signed_in?
  		redirect_to :login_signup
  	end
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
  	@charger = Charger.find(params[:id])
  	@comments = @charger.raitings.all
  	@comment = @charger.raitings.new
  	@my_charger_id = -1
  	if !Charger.where(:user_id => current_user.id, :id => @charger).empty?
  		@my_charger_id = current_user.chargers.find(params[:id]).user_id
  	end
  	@my_id = current_user.id

  	@exists = false
  	if !@charger.raitings.where(:user_id => current_user.id)[0].blank? && !@charger.raitings.where(:user_id => current_user.id)[0].review.blank?
  		@exists = true
  	end

  	@positive = 0
  	@charger.raitings.each do |c|
  		if !c.blank?
  			if c.ok == true
  				@positive += 1
  			end
  		end
  	end

  	@negative = 0
  	@charger.raitings.each do |c|
  		if !c.blank?
  			if c.ok == false
  				@negative += 1
  			end
  		end
  	end
  end

  def edit_charger
  	if !user_signed_in?
  		redirect_to :login_signup
  	end
  	@charger = current_user.chargers.find(params[:id])
  	if !(@charger.user_id == current_user.id)
  		redirect_to :my_chargers
  	end
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
  	if !user_signed_in?
  		redirect_to :login_signup
  	end
  	@charger = Charger.find(params[:id])
  	if !(@charger.user_id == current_user.id)
  		redirect_to :my_chargers
  	end
  	if @charger.destroy
  		redirect_to :my_chargers
  	else
  		render 'view_charger'
  	end
  end

  # ALL ABOUT COMMERCIAL CHARGERS
  def all_commercial_chargers
  	@chargers = CommercialCharger.all
  end

  def view_commercial_charger
  	@charger = CommercialCharger.find(params[:id])
  	@comments = @charger.raitings.all
  	@comment = @charger.raitings.new

  	@positive = 0
  	@charger.raitings.each do |c|
  		if !c.blank?
  			if c.ok == true
  				@positive += 1
  			end
  		end
  	end

  	@negative = 0
  	@charger.raitings.each do |c|
  		if !c.blank?
  			if c.ok == false
  				@negative += 1
  			end
  		end
  	end
  end

  def new_c_comment
  	if !user_signed_in?
  		redirect_to :login_signup
  	end
  	@charger = CommercialCharger.find(params[:id])
  	if !@charger.raitings.where(:user_id => current_user.id)[0].blank? && !@charger.raitings.where(:user_id => current_user.id)[0].review.blank?
  		redirect_to :charger
  	end
  	@comment = @charger.raitings.new
  end

  def create_c_comment
  	@charger = CommercialCharger.find(params[:id])
  	@comment = @charger.raitings.new(comment_params)
  	if @comment.save
  		redirect_to :commercial_charger
  	else
  		render :new_c_comment
  	end
  end


  # user can't log in/sign up if logged in
  def login_signup
  	if user_signed_in?
  		redirect_to :root
  	end
  end

  # THUMBS UP AND THUMBS DOWN

  def thumbs_up
  	if !user_signed_in?
  		redirect_to :login_signup
  	end
  	@charger = Charger.find(params[:id])
  	if @charger.raitings.where(:user_id => current_user.id).empty?
  		@charger.raitings.create(:ok => true, :user_id => current_user.id)
  		redirect_to :charger
  	else
  		@charger.raitings.where(:user_id => current_user.id)[0].update(:ok => true)
	  	redirect_to :charger
	end
  end

  def thumbs_down
  	if !user_signed_in?
  		redirect_to :login_signup
  	end
  	@charger = Charger.find(params[:id])
  	if @charger.raitings.where(:user_id => current_user.id).empty?
  		@charger.raitings.create(:ok => false, :user_id => current_user.id)
  		redirect_to :new_comment
  	else
	  	@charger.raitings.where(:user_id => current_user.id)[0].update(:ok => false)
	  	redirect_to :new_comment
	end
  end

  def thumbs_c_up
  	if !user_signed_in?
  		redirect_to :login_signup
  	end
  	@charger = CommercialCharger.find(params[:id])
  	if @charger.raitings.where(:user_id => current_user.id).empty?
  		@charger.raitings.create(:ok => true, :user_id => current_user.id)
  		redirect_to :commercial_charger
  	else
  		@charger.raitings.where(:user_id => current_user.id)[0].update(:ok => true)
	  	redirect_to :commercial_charger
	end
  end

  def thumbs_c_down
  	if !user_signed_in?
  		redirect_to :login_signup
  	end
  	@charger = CommercialCharger.find(params[:id])
  	if @charger.raitings.where(:user_id => current_user.id).empty?
  		@charger.raitings.create(:ok => false, :user_id => current_user.id)
  		redirect_to :new_c_comment
  	else
	  	@charger.raitings.where(:user_id => current_user.id)[0].update(:ok => false)
	  	redirect_to :new_c_comment
	end
  end

  #REVIEWS

  def new_comment
  	if !user_signed_in?
  		redirect_to :login_signup
  	end
  	@charger = Charger.find(params[:id])
  	if !@charger.raitings.where(:user_id => current_user.id)[0].blank? && !@charger.raitings.where(:user_id => current_user.id)[0].review.blank?
  		redirect_to :charger
  	end
  	@comment = @charger.raitings.new
  end

  def create_comment
  	@charger = Charger.find(params[:id])
  	@comment = @charger.raitings.new(comment_params)
  	if @comment.save
  		redirect_to :charger
  	else
  		render :new_comment
  	end
  end

  def get_price
    @price = Charger.where(:location => "#{params[:lat]}, #{params[:lng]}")[0].price
    render :layout => false
  end

  def get_rating_points
    if !Charger.where(:location => "#{params[:lat]}, #{params[:lng]}")[0].raitings.empty?
      ratings_balance = Charger.where(:location => "#{params[:lat]}, #{params[:lng]}")[0].raitings.where(:ok => true).length - Charger.where(:location => "#{params[:lat]}, #{params[:lng]}")[0].raitings.where(:ok => false).length 
      log10 = Math.log10(ratings_balance).ceil
      if log10 == 0
        log10 = 1
      end
      @rating_points = ratings_balance.to_f/(10**log10)
    else
      @rating_points = 0
    end
    render :layout => false
  end

  private

		def charger_params
			params.require(:charger).permit(:price, :location, :phone, :charger_type)
		end

		def comment_params
			params.require(:raiting).permit(:review, :id)
		end
end