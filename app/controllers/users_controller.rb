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
		@user.update_attributes(params[:user])

		flash[:notice] = "Profile updated"
		redirect_to @user
	end

	def destroy
	end

	def sign_in
	end


end
