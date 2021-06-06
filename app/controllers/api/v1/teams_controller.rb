class Api::V1::TeamsController < ApiController
  before_action :find_season
  before_action :find_team, only: [:update, :destroy]

  def index
    teams = Team.where(season: @season).includes(:players )
    render json: teams, status: 200, each_serializer: DeepTeamSerializer
  end

  def create
    team = Team.new(team_params)
    team.season = @season
    if team.save
      render json: team, status: 201
    else
      render json: {:error => "Error creating new team"}, status: 400
    end
  end

  def update
    if team_in_season?
      @team.update(team_params)
      render json: @team, status: 200
    else
      render json: {:error => "Error updating team"}, status: 400
    end
  end

  private

    def find_season
      @season ||= Season.find_by(id: params[:season_id])
      if !@season
        render json: {:error => "Cannot find season #{params[:season_id]}"}, status: 404
      end
    end

    def find_team
      @team ||= Team.find_by(id: params[:id])
      if !@team
        render json: {error: "Cannot find team #{params[:id]}"}, status: 404
      end
    end

    def team_in_season?
      @season.teams.include?(@team)
    end

    def team_params
      params.permit(:name)
    end
end