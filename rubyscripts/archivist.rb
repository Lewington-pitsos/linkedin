require 'pg'

class Archivist

  @@database_name = 'linkedin'

  def initialize
    self.db = PG.connect({ dbname: @@database_name, user: 'postgres' })
  end

  def setup_tables
    self.db.exec(
      <<~HEREDOC

        CREATE TABLE people (
          id serial,
          first_name VARCHAR,
          last_name VARCHAR,
          current_job VARCHAR,
          country VARCHAR,
          further_location VARCHAR,
          education VARCHAR,
          employer_id INTEGER REFERENCES employer(id) ON DELETE CASCADE,
          PRIMARY KEY(id)
        );

        CREATE TABLE employer (
          id serial,
          name VARCHAR,
          PRIMARY KEY(id)
        );

      HEREDOC
  end

end
