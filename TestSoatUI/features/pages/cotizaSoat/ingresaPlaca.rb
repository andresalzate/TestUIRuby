class IngresaPlaca < SitePrism::Page
  #byebug
  set_url "#{PROTOCOL_SCHEMA}#{YOUSE_URL}/soat/order"
  element :btn_continuar, 'button[type="submit"]'
  element :txt_placa, '#plate'

  def ingresa_Placa_form(placa)
    txt_placa.set placa.placa
    btn_continuar.click
  end
end
