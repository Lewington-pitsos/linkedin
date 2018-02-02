require 'capybara'
require "capybara-webkit"

require_relative 'login'

Capybara.register_driver(:webkit) { |app| Capybara::Webkit::Driver.new(app, js_errors: false) }
Capybara.javascript_driver = :webkit
Capybara.default_driver = :webkit
Capybara.ignore_hidden_elements = false

class Session

  attr_accessor :session, :archivist, :login

  def initialize(db_name=nil)
    self.session = Capybara.current_session
    self.archivist = Archivist.new(db_name)
    self.login = Login.new(session, archivist)
  end
end
