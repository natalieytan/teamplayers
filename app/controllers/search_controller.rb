class SearchController < ApplicationController
  def teams
    if params[:teamsearch]
      search_params = params.require(:teamsearch).permit(:sport_id, skill_id:[], gender_id: [])
      @teams = Team.where(search_params)
      flash[:notice] = "Showing your search results"
    else
      
    end
  end

  def players
    if params[:playersearch]
      User.joins(:interests, :profile).where(interests: {sport_id: 1}, profiles: {gender: 2})
      flash[:notice] = "Showing your search results"
    else
    end
  end
end
