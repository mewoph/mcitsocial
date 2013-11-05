class CompaniesController < ApplicationController

	before_filter :authenticate_user!

	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
	end

	def show
		@company = Company.find(params[:id])
	end

	def create
		@company = Company.new(params[:company])
		@company.save
		redirect_to @company
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
	end

	def destroy
	end

end
