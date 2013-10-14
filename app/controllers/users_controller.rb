class UsersController < ApplicationController

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
	end

	def update
	end

	def destroy
	end


end
