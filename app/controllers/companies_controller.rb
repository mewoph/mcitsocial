class CompaniesController < ApplicationController

	before_filter :authenticate_user!

	def index
		@companies = Company.order(:name).page params[:page]
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
		existing_company = Company.find_by_name params[:company][:name]
		if existing_company.nil?
			@company = Company.new(params[:company])
			if @company.save
				flash[:notice] = "Company Created"
				redirect_to @company
			else
				flash[:alert] = "Company name cannot be blank."
				redirect_to :back
			end
		else
			redirect_to company_path(existing_company.id)
			flash[:notice] = "Company Already Exists"
		end
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
	end

	def destroy
	end

end
