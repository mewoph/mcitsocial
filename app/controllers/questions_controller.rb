class QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def show
		@question = Question.find(params[:id])
	end

	def create
		@question = Question.find(params[:id])
		@question.save
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
	end

	def destroy
	end


end
