require 'capybara'
require "capybara-webkit"

require_relative 'login'
require_relative '../helpers/screlper'

Capybara.register_driver(:webkit) { |app| Capybara::Webkit::Driver.new(app, js_errors: false) }
Capybara.javascript_driver = :webkit
Capybara.default_driver = :webkit
Capybara.ignore_hidden_elements = false
Capybara.current_driver = Capybara.javascript_driver

class Session

  attr_accessor :session, :archivist, :login

  def initialize(db_name=nil)
    self.session = Capybara.current_session
    self.archivist = Archivist.new(db_name)
    self.login = Login.new(session, archivist)
  end

  def login_phase()
    login.login()
  end
end
