class FeedbacksController < ApplicationController

	def index
		@questions = Feedback.where(is_question: true)
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
