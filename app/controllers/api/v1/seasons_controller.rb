class Api::V1::SeasonsController < ApiController
  before_action :find_league
  before_action :find_season, except: [:create]

  def create
    season = Season.new(season_params)
    season.league = @league
    if season.save
      render json: season, status: 201
    else
      render json: {:error => "Error creating new season"}, status: 400
    end
  end
  
  def update
    if @league.seasons.include?(@season)
      @season.update(season_params)
      render json: @season, status: 200
    else
      render json: {:error => "Error updating season"}, status: 400
    end
  end

  private

    def find_league
      @league ||= League.find_by(id: params[:league_id])
      if not @league
        render json: {:error => "Cannot find league #{params[:league_id]}"}, status: 404
      end
    end

    def find_season
      @season ||= Season.find_by(id: params[:id])
      if not @season
        render json: {:error => "Cannot find season #{params[:id]}"}, status: 404
      end
    end

    def season_params
      params.permit(:name)
    end
end