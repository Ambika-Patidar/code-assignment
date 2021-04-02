class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = current_user.teams
  end

  def create
    @team = current_user.teams.new(team_params)
    if @team.save
      flash[:info] = "Team successfully created"
    else
      flash[:danger] = "Unable to create team"
    end
    redirect_to teams_path
  end

  def destroy
    @team = current_user.teams.find(params[:id])
      if @team.destroy
        flash[:info] = 'Team Successfully Deleted'
        redirect_to_teams_path
      else
        flash[:danger] = 'Team Not Deleted'
      end
  end

  private

  def team_params
    params.permit(:name)
  end
end
