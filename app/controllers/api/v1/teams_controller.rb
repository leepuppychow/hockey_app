class Api::V1::TeamsController < ApiController
  before_action :find_season

  def index
    teams = Team.where(season: @season).includes(:players )
    render json: teams, status: 200, each_serializer: DeepTeamSerializer
  end

  private

    def find_season
      @season ||= Season.find_by(id: params[:season_id])
      if not @season
        render json: {:error => "Cannot find season #{params[:season_id]}"}, status: 404
      end
    end
end