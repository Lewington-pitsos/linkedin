require "minitest/autorun"

require_relative '../rubyscripts/session'
require_relative '../rubyscripts/archivist'

TEST_DB = 'linkedin_test'

class OfflineTests < Minitest::Test

  def setup
  end

  def test_archivist_makes_and_kills_tables
    @archivist = Archivist.new(TEST_DB)
    @archivist.setup_tables
    assert_raises('ERROR') { @archivist.show_table('people') }
    assert_raises('ERROR') { @archivist.show_table('employers') }
    assert @archivist.show_table('people')
    assert @archivist.show_table('employers')
    @archivist.clear_database
    assert_raises('ERROR') { @archivist.show_table('people') }
    assert_raises('ERROR') { @archivist.show_table('employers') }
  end

end
