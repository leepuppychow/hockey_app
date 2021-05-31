class Api::V1::LeaguesController < ApiController
  before_action :find_league, except: [:index, :create]

  def index
    render json: League.includes(seasons: [:teams]).all, include: '**', status: 200
  end

  def show
    if @league
      render json: @league, status: 200
    else
      render json: {:error => "Error finding hockey league #{params[:id]}"}, status: 404
    end
  end

  def create
    league = League.new(league_params)
    if league.save
      render json: league, status: 201
    else
      render json: {:error => "Error creating new hockey league"}, status: 400
    end
  end

  def update
    if @league && !league_params.empty?
      @league.update(league_params)
      render json: @league, status: 200
    else
      render json: {:error => "Error updating hockey league: #{@league.id}"}, status: 400
    end
  end

  def destroy
    if @league
      @league.destroy
      render json: {}, status: 204
    else
      render json: {:error => "Error deleting hockey league #{params[:id]}"}, status: 404
    end
  end

  private
    def find_league
      @league ||= League.find_by(id: params[:id])
    end

    def league_params
      params.permit(:name)
    end
end 