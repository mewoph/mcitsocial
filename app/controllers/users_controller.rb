class UsersController < ApplicationController

	before_filter :authenticate_user!, :except => [:sign_in]
	before_filter :get_user, :only => [:show, :create, :edit, :update, :validate_bio_length]
	before_filter :is_owner, :only => [:edit, :update]
	before_filter :validate_bio_length, :only => [:create, :update]

	def index
		if params[:search].blank?
			@users = User.order('created_at DESC').page params[:page]
		else
			@results = User.search do
				fulltext params[:search] do
			    	fields(:first_name)
			    	fields(:last_name)
			    	fields(:previous_work)
			    	fields(:areas_of_interest)
			    	fields(:languages)
			    end
			    order_by(:created_at, :desc)
			    paginate :page => params[:page], :per_page => 4
			end
			@users = @results.results
		end
	end

	def new
		@user = User.new
	end

	def show
	end

	def create
		@user.save
	end

	def edit
	end

	def update
		params[:user][:matriculation_date] = make_date(params[:user][:matriculation_date])
		params[:user][:graduation_date] = make_date(params[:user][:graduation_date])
		@user.update_attributes(params[:user])

		flash[:notice] = "Profile updated"
		redirect_to @user
	end

	def destroy
	end

	def landing
	end

	def sign_in
	end

	protected 

	def get_user 
		@user = User.find(params[:id])
	end

	def make_date(date_string)
		if !date_string.blank?
			begin
				formatted_date = Date.strptime(date_string)
			rescue
				formatted_date = Date.strptime(date_string, "%m-%Y")
			end	
		end
	end

	def is_owner
		if params[:id].to_i != current_user.id
			flash[:notice] = "You can't edit other people's profile."
			redirect_to users_path
		end
	end

	def validate_bio_length
		if params[:user][:bio].length > 140
			flash[:notice] = "Cannot save profile, because bio exceeds 140 chars."
			redirect_to @user
		end
	end
end
