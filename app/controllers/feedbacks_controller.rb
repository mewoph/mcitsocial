class FeedbacksController < ApplicationController

	before_filter :authenticate_user!

	def index
		if params[:search].blank?
			@search_results = false
			@questions = Feedback.where(is_question: true).order('created_at DESC').page params[:page]
		else
			@search_results = true 
			@results = Feedback.search do
				fulltext params[:search] do
			    	fields(:feedback_content)
			    end
			    with :is_question, true
			    order_by :created_at, :desc
			    paginate :page => params[:page], :per_page => 5
			end
			@questions = @results.results
		end
	end

	def new
		@feedback = Feedback.new(:is_question => true)
		if not params[:company_id].blank?
			@feedback.company_id = params[:company_id]
		end
		if not params[:is_question].blank?
			@feedback.is_question = params[:is_question]
		end
		if not params[:feedback_content].blank?
			@feedback.feedback_content = params[:feedback_content]
		end
	end

	def show
		@feedback = Feedback.find(params[:id])
		if not params[:comment].blank?
			@comment = Comment.new(:commenter_id => current_user.id, :content_id => params[:id], :comment => params[:comment])
			@comment.save
			redirect_to feedback_path(@feedback.id)
		end
		if not params[:comment_response].blank?
			@comment_response = SubComment.new(:commenter_id => current_user.id, :content_id => params[:responding_to_id], :comment => params[:comment_response])
			@comment_response.save
			redirect_to feedback_path(@feedback.id)
		end
		@feedback_comments = Comment.where(:content_id => params[:id])

		
	end

	def create
		@feedback = Feedback.new(params[:feedback])
		if @feedback.save
			flash[:notice] = "Feedback Created"
			redirect_to company_path(@feedback.company_id)
		else
			flash[:alert] = "Please complete the form."
			redirect_to new_feedback_path(:feedback_content => params[:feedback][:feedback_content], :company_id => params[:feedback][:company_id], :is_question => params[:feedback][:is_question])
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
