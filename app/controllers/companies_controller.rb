class CompaniesController < ApplicationController

	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
	end

	def show
		@company = Company.find(params[:id])
		@questions = @company.feedbacks.where(:is_question => true)
		@comments = @company.feedbacks.where(:is_question => false)
	end

	def create
		@company = Company.find(params[:id])
		@company.save
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
	end

	def destroy
	end

end
