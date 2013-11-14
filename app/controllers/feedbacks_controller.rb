class FeedbacksController < ApplicationController

	before_filter :authenticate_user!

	def index
		@questions = Feedback.where(is_question: true).order(:created_at).page params[:page]
		if params[:search].blank?
			@search_results = false
			@questions = Feedback.where(is_question: true).order(:created_at).page params[:page]
		else
			@search_results = true 
			@results = Feedback.search do
				fulltext params[:search] do
			    	fields(:feedback_content)
			    end
			end
			@questions = @results.results
		end
	end

	def new
		@feedback = Feedback.new
		if not params[:company_id].nil?
			@feedback.company_id = params[:company_id]
		end
	end

	def show
		@feedback = Feedback.find(params[:id])
	end

	def create
		@feedback = Feedback.new(params[:feedback])
		if @feedback.save
			flash[:notice] = "Feedback Created"
			redirect_to company_path(@feedback.company_id)
		else
			flash[:alert] = "Please complete the form."
			redirect_to :back
		end
	end

	def edit
		@feedback = Feedback.find(params[:id])
	end

	def update
	end

	def destroy
	end


end
