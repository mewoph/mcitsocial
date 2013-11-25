class ProtipsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@protips = Protip.all

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

end
