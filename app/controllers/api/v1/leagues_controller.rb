class Api::V1::LeaguesController < ApiController
  def index
    render json: League.all, status: 200
  end

  def create
    league = League.new(league_params)
    if league.save
      render json: league, status: 201
    else
      render json: {:error => "Error creating new hockey league"}, status: 400
    end
  end

  private

    def league_params
      params.permit(:name)
    end
end 