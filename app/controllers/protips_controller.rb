class ProtipsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@protips = Protip.all
		@philly_tips = Protip.where(:category => find_category_id("Philly Tips")).order('cached_votes_up DESC')
		@penn_tips = Protip.where(:category => find_category_id("Penn Tips")).order('cached_votes_up DESC')
		@interview_tips = Protip.where(:category => find_category_id("Interview Tips")).order('cached_votes_up DESC')
		@misc_tips = Protip.where(:category => find_category_id("Miscellaneous")).order('cached_votes_up DESC')
	end

	def new
		@protip = Protip.new
	end

	def show
    	@protip = Protip.find(params[:id])

		if not params[:comment].blank?
			@comment = Comment.new(:commenter_id => current_user.id, :content_id => params[:id], :comment => params[:comment], :source => 'protip')
			@comment.save
			redirect_to protip_path(@protip.id)
		end

		@protip_comments = Comment.where(:content_id => params[:id], :source => 'protip').order("cached_votes_up DESC")
		if not params[:update_protip_id].blank?
			@protip = Protip.find(params[:update_protip_id])
			if not params[:like].blank?
				@protip.unliked_by current_user
			else
				@protip.liked_by current_user				
			end
		end

	end

	def create
    @protip = Protip.new(params[:protip])
		if @protip.save
			flash[:notice] = "Protip Created"
			redirect_to protip_path(@protip)
		else
			flash[:alert] = "Please complete the form."
			redirect_to new_protip_path(:adder_id => params[:protip][:adder_id], :title => params[:protip][:title], :content => params[:protip][:content])
		end
	end

	def edit

	end

	def update
	end

	def destroy

	end

	private
		def find_category_id(name)
			category = Category.find_by_name name
			category.id.to_s
		end

end
