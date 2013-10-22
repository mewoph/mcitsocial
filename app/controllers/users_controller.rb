class UsersController < ApplicationController

	before_filter :authenticate_user!, :except => [:sign_in]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.find(params[:id])
		@user.save
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		params[:user][:matriculation_date] = make_date(params[:user][:matriculation_date])
		params[:user][:graduation_date] = make_date(params[:user][:graduation_date])
		@user.update_attributes(params[:user])

		flash[:notice] = "Profile updated"
		redirect_to @user
	end

	def destroy
	end

	def sign_in
	end

	protected 
	def make_date(date_string)
		if !date_string.blank?
			begin
				formatted_date = Date.strptime(date_string)
			rescue
				formatted_date = Date.strptime(date_string, "%m-%Y")
			end	
		end
	end
end
