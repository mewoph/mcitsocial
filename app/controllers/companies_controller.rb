class CompaniesController < ApplicationController

	before_filter :authenticate_user!

	def index
		if params[:search].blank?
			@search_results = false
			@companies = Company.order(:name).page params[:page]
		else
			@search_results = true 
			@results = Company.search do
				fulltext params[:search] do
			    	fields(:name)
			    end
			end
			@companies = @results.results
		end

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
			@company.save
			flash[:notice] = "Company Created"
			redirect_to @company
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
