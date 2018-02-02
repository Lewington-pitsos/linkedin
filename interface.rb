require_relative 'rubyscripts/session'
require_relative 'rubyscripts/archivist'

archivist = Archivist.new()
#archivist.setup_tables()
p archivist.show_tables
