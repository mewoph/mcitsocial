class FeedbacksController < ApplicationController

	before_filter :authenticate_user!

	def index
		if params[:search].blank?
			@search_results = false
			@questions = Feedback.where(is_question: true)
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
		@feedback.company_id = params[:company_id]
	end

	def show
		@feedback = Feedback.find(params[:id])
	end

	def create
		@feedback = Feedback.new(params[:feedback])
		@feedback.save
		redirect_to company_path(@feedback.company_id)
	end

	def edit
		@feedback = Feedback.find(params[:id])
	end

	def update
	end

	def destroy
	end


end
