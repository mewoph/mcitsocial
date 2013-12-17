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
			    order_by :created_at, :desc
			    paginate :page => params[:page], :per_page => 5
			end
			@companies = @results.results
		end

	end

	def new
		@company = Company.new
		if params[:back_to_form].present?
			$back_to_form = true
		end
	end

	def show
		@company = Company.find(params[:id])
		@questions = @company.feedbacks.where(:is_question => true).order('created_at DESC')
		@comments = @company.feedbacks.where(:is_question => false).order('created_at DESC')
	end

	def create
		existing_company = Company.find_by_name params[:company][:name]
		if existing_company.nil?
			@company = Company.new(params[:company])
			if @company.save
				flash[:notice] = "Company Created"

				if $back_to_form
					$back_to_form = false
					redirect_to new_feedback_path(:company_id => @company.id)
				else
					redirect_to @company
				end

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
