class ProtipsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@protips = Protip.all
		@philly_tips = Protip.where(:category => find_category_id("Philly Tips")).order('created_at DESC')
		@penn_tips = Protip.where(:category => find_category_id("Penn Tips")).order('created_at DESC')
		@interview_tips = Protip.where(:category => find_category_id("Interview Tips")).order('created_at DESC')
		@misc_tips = Protip.where(:category => find_category_id("Miscellaneous")).order('created_at DESC')
	end

	def new
		@protip = Protip.new

	end

	def show
    @protip = Protip.find(params[:id])


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
