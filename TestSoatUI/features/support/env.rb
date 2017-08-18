require 'rspec/expectations'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/window'
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'
require 'csv'
require 'data_magic'
require 'active_support'
require 'active_support/core_ext'
require 'genesis'
require 'byebug'
require 'addressable'
World(RSpec::Matchers)

env = ['local', 'docker', 'qa', 'stg', 'prod'].include?(ENV['ENV']) ? ENV['ENV'].to_sym : :qa
DEBUG = ENV['DEBUG'] || false
FILE_PATH = './features/step_definitions/files/'.freeze
CONSTANTE_TEMPO = ENV['TEMPO'] ? ENV['TEMPO'].to_i : 1
PROTOCOL_SCHEMA = [:local, :docker].include?(env) ? 'http://' : 'https://'


SitePrism.configure do |config|
    config.use_implicit_waits = true
end

AMBIENTES_CONFIG = {
    local: ['localhost:3000'],
    docker: ['localhost:9000'],
    #qa: ['qa.youse.io'],
    qa: ['qa.youse-co.io/soat/order'],
    stg: ['www-stage.youse.io'],
    prod: ['www.youse.com.br']
}.freeze

YOUSE_URL = AMBIENTES_CONFIG.fetch(env)[0]
