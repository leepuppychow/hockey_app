class Api::V1::SeasonsController < ApiController
  before_action :find_league

  def create
    season = Season.new(season_params)
    season.league = @league
    if season.save
      render json: season, status: 201
    else
      render json: {:error => "Error creating new season"}, status: 400
    end
  end

  private

    def find_league
      @league ||= League.find(params[:league_id])
    end

    def season_params
      params.permit(:name)
    end
end