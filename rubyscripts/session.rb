require 'capybara'
require "capybara-webkit"

require_relative './login'

Capybara.register_driver(:webkit) { |app| Capybara::Webkit::Driver.new(app, js_errors: false) }
Capybara.javascript_driver = :webkit
Capybara.default_driver = :webkit
Capybara.ignore_hidden_elements = false

class Session
  def initialize
    self.login = Login.new()
    self.archivist = Archivist.new()
  end
end
