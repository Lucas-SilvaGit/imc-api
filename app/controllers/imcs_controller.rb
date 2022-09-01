class ImcsController < ApplicationController
  before_action :set_imc, only: [:show, :update, :destroy]

  # POST /imcs
  def create
    @imc = Imc.create!(imc_params)
    json_response(@imc, :created)
  end

  private

  def imc_params
    # whitelist params
    params.permit(:height, :weight)
  end

  def set_todo
    @imc = Imc.find(params[:id])
  end
end