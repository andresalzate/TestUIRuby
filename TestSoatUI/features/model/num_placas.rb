class RandomPlacas
    include DataMagic
    attr_accessor :placa

    def initialize create_type
      obj = data_for "placas_auto/#{create_type.to_s}"
      @placa = obj["placa"]
    end
end
