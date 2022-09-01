class ImcController < ApplicationController
  def imc
    
    imc_service = CalcImcService.new(params[:height], params[:weight])
    if imc_service.valid?
      imc = imc_service.call
      json_response({
          "imc": imc,
          "classification": obesity(imc),
          "obesity": imc < 30 ? "0" : degree_of_obesity(imc)
        })
    else
      json_response({ message: imc_service }, :bad_request)
    end
  end

  def obesity(imc)
    case imc
    when 0..18.5
      "Peso Baixo"
    when 18.5..24.9
      "Peso normal ou adequado"
    when 25..29.9
      "Sobrepeso"
    when 30..34.9
      "Obsidade Grau I"
    when 35..39.9
      "Obsidade Grau II"
    else
      "Obsidade Grau III ou Mórbida"
    end
  end

  def degree_of_obesity(imc)
    case imc
    when 30..34.9
      "I"
    when 35..39.9
      "II"
    else
      "III"
    end
  end
end
