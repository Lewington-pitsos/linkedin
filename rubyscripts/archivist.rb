require 'pg'

class Archivist

  @@database_name = 'linkedin'

  def initialize
    self.db = PG.connect
  end

  def setup

  end

end
