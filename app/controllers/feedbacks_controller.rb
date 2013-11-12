class FeedbacksController < ApplicationController

	before_filter :authenticate_user!

	def index
		if params[:search].blank?
			@search_results = false
			@feedbacks = Feedback.where(is_question: true)
		else
			@search_results = true 
			@results = Feedback.search do
				fulltext params[:search] do
			    	fields(:feedback_content)
			    end
			end
			@feedbacks = @results.results
		end
	end

	def new
		@feedback = Feedback.new
	end

	def show
		@feedback = Feedback.find(params[:id])
	end

	def create
		@feedback = Feedback.find(params[:id])
		@feedback.save
	end

	def edit
		@feedback = Feedback.find(params[:id])
	end

	def update
	end

	def destroy
	end


end
