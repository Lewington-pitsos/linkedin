require_relative 'crawler'

class Login < Crawler

  @@login_link = 'https://www.linkedin.com/'

  def initialize(session, archivist)
    super(session, archivist)
  end

  def login
    tputs "visiting #{@@login_link}"
    self.session.visit(@@login_link)
  end
end
