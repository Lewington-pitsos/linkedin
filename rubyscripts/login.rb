require_relative 'crawler'

class Login < Crawler

  @@login_link = 'https://www.linkedin.com/uas/login'
  @@password = 'q1as1z2'
  @@email = 'idof@live.com.au'

  @@email_id = "#session_key-login"
  @@pass_id = '#session_password-login'
  @@submit_id = '#btn-primary'

  def initialize(session, archivist)
    super(session, archivist)
  end

  def login
    visit_login_page
    fill_details
  end

  def visit_login_page
    tputs "visiting #{@@login_link}"
    self.session.visit(@@login_link)
  end

  def fill_details
    # fills on email and password fields and submits login form
    tputs "inputting login details"
    self.session.find(@@email_id).set(@@email)
    self.session.find(@@pass_id).set(@@password)
    self.session.find(@@submit_id).click()
    # linkedin takes it's time to log us in
    sleep(8)
  end
end
