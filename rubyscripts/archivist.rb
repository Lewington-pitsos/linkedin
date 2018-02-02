require 'pg'

class Archivist

  attr_accessor :db

  @@database_name = 'linkedin'

  def initialize(name=@@database_name)
    self.db = PG.connect({ dbname: name, user: 'postgres' })
  end

  def setup_tables
    # creates all the tables that the database needs
    self.db.exec(
      <<~HEREDOC

        CREATE TABLE employers (
          id serial,
          name VARCHAR,
          PRIMARY KEY(id)
        );

        CREATE TABLE people (
          id serial,
          first_name VARCHAR,
          last_name VARCHAR,
          current_job VARCHAR,
          country VARCHAR,
          further_location VARCHAR,
          education VARCHAR,
          employer_id INTEGER REFERENCES employers(id) ON DELETE CASCADE,
          PRIMARY KEY(id)
        );


      HEREDOC
    )
  end

  def clear_database
    self.db.exec(
      <<~HEREDOC
        DROP TABLE people;
        DROP TABLE employers;
      HEREDOC
    )
  end

  def show_table(name)
    self.db.exec(
      <<~HEREDOC
        SELECT * FROM #{name};
      HEREDOC
    )
  end

end
