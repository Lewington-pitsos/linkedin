require_relative 'crawler'

class Login < Crawler

  @@login_link = 'https://www.linkedin.com/uas/login'
  @@password = 'q1as1z2'
  @@email = 'idof@live.com.au'

  @@email_id = "#session_key-login"
  @@pass_id = '#session_password-login'
  @@submit_id = '#btn-primary'

  @@default_search = 'https://www.linkedin.com/search/results/people/?origin=SWITCH_SEARCH_VERTICAL&page=10'
  @@person_link_id = '.name.actor-name'

  def initialize(session, archivist)
    super(session, archivist)
  end

  def login
    visit_login_page
    fill_details
  end

  def visit_login_page
    tputs "visiting #{@@login_link}"
    session.visit(@@login_link)
  end

  def fill_details
    # fills on email and password fields and submits login form
    tputs "inputting login details"
    session.find(@@email_id).set(@@email)
    session.find(@@pass_id).set(@@password)
    session.find(@@submit_id).click()

    # linkedin takes it's time to log us in
    sleep(3)
  end

  def search
    session.visit(@@default_search)
    tputs 'Search complete: currently on ' + session.url
  end

  def visit_first_person
    session.first(@@person_link_id).click()
    tputs 'Person visited, currently on ' + session.url
  end
end
