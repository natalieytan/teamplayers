class ProfilesController < ApplicationController
  before_action :set_profile_and_interests, only: [:show]

  # Shows user profile by id
  # GET /profiles/1
  def show
  end

  # Allow User to View Own Profile
  # Get /profile
  def own
    @profile = current_user.profile
    @interests = current_user.interests
    @teams = current_user.teams
    if @profile.not_modified?
      flash[:alert] = "You have yet to create your profile. Please create one!"
      redirect_to myprofile_edit_path
    end
  end

  # Allow User to Create or Edit Own Profile
  # GET /profile/edit
  def edit
    @profile = Profile.find_or_initialize_by(user: current_user)
  end

  # Creates User Profile
  # POST /profiles
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      flash.now[:notice] = "Profile was successfully created."
      redirect_to profile_path
    else
      render :edit
    end
  end

  # Updates User Profile
  # PATCH/PUT /profiles/1
  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      flash[:notice] = 'Profile was successfully updated.'
      redirect_to profile_path
    else
      flash.now[:alert] = "Unable to update profile. Please check errors."
      render :edit
    end
  end

  private
    def set_profile_and_interests
      user = User.find(params[:id])
      @profile = user.profile
      @interests = user.interests
      @teams = user.teams
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :birth_date, :gender, :image, :city, :state, :country, :description, :postcode)
    end
end
