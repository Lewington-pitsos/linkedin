require_relative 'crawler'

class Login < Crawler

  @@login_link = 'https://www.linkedin.com/'
  @@password = 'q1as1z2'
  @@email = 'idof@live.com.au'

  @@email_id = "login-email"
  @@pass_id = 'login-password'
  @@submit_id = '#login-submit'
  @@form_id = '.login-form'

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
    self.session.fill_in(@@email_id, with: @email)
    self.session.fill_in(@@pass_id, with: @@password)

    # linkedin craftily made it impossible so click() the submit input (I suspect mouseover shinanigans)
    self.session.execute_script("$('#{@@form_id}').submit()")
    # for some reason triggering a click on the form submit input seemed to have no effect

    # linkedin takes it's time to log us in
    sleep(8)
  end
end
