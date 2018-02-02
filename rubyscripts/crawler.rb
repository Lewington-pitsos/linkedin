class Crawler

  attr_accessor :session, :archivist

  def initialize(session, archivist)
    self.session = session
    self.archivist = archivist
  end
end
