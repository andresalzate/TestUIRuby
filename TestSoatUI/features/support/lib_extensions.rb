module Lib
  def generate_placa_with type
      RandomPlacas.new type
  end

  def placa type
    placas = {
      'correcta': :placa_correcta
    }.freeze
    generate_placa_with (placas[type.downcase.to_sym])
  end
end
World(Lib)
