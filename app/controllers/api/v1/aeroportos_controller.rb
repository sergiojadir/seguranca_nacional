class Api::V1::AeroportosController < ApplicationController
  before_action :set_aeroporto, only: [:show, :update, :destroy]

  # GET /aeroportos
  def index
    @aeroportos = Aeroporto.all

    render json: @aeroportos
  end

  # GET /aeroportos/1
  def show
    render json: @aeroporto
  end

  # POST /aeroportos
  def create
    @aeroporto = Aeroporto.new(aeroporto_params)

    if @aeroporto.save
      render json: @aeroporto, status: :created, location: @aeroporto
    else
      render json: @aeroporto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /aeroportos/1
  def update
    if @aeroporto.update(aeroporto_params)
      render json: @aeroporto
    else
      render json: @aeroporto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /aeroportos/1
  def destroy
    @aeroporto.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aeroporto
      @aeroporto = Aeroporto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def aeroporto_params
      params.require(:aeroporto).permit(:nome, :codigo, :cidade_id)
    end
end
