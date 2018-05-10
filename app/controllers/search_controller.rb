class SearchController < ApplicationController
  def teams
    @teams = Team.none
    if params[:teamsearch]
      search_params = params.require(:teamsearch).permit(:location, :distance, :sport_id, skill_id:[], gender_id: [])
      if params[:teamsearch][:sport_id].empty?
        flash.now[:alert] = "Please enter a sport you are searching for."
        render :teams
      else
        location = search_params[:location]
        distance = search_params[:distance] || 5
        @coords = Geocoder.coordinates(location)
        search_criteria = search_params.slice(:sport_id, :skill_id, :gender_id)
        @teams = @location.present? ? Team.includes(:gender, :sport, :skill).near(location, distance).where(search_criteria) : Team.includes(:gender, :sport, :skill).where(search_criteria)
        @teams.present? ? flash.now[:notice] = "Showing teams which match your search." : flash.now[:alert] = "Could not find any team that matched your search requests."
      end
    else
    end
  end

  def players
    @players = Profile.none
    if params[:playersearch]
      sport = params[:interests][:sport_id]
      gender = params[:profile][:gender]
      if (gender.empty? or sport.empty?)
        flash.now[:alert] = "Please specify a sport and gender to find a player."
      else
        skill = params[:interests][:skill] || [1, 2, 3, 4, 5]
        @location = params[:playersearch][:location]
        distance = params[:playersearch][:distance] || 5 
        @players = @location.present? ? Profile.joins(user: :interests).near(@location, distance).where(interests: {sport_id: sport, skill: skill}, gender: gender) : Profile.joins(user: :interests).where(interests: {sport_id: sport, skill: skill}, gender: gender)
        flash.now[:notice] = "Showing players who match your search."
      end
    else
      
    end
  end
end
