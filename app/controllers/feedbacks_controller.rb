class FeedbacksController < ApplicationController

	def index
		@feedbacks = Feedback.all
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
