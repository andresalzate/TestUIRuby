Given(/^usuario ingresa a la pagina princial de youse$/) do
  home.load
end

Given(/^que se esta en soat$/) do
  @digSoat = IngresaPlaca.new
  @placa = placa("correcta")
end

When(/^digitar placa y continuar$/) do
  @digSoat.ingresa_Placa_form(@placa)
end
