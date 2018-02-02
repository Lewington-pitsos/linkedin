require "minitest/autorun"

require_relative '../rubyscripts/session'
require_relative '../rubyscripts/archivist'

TEST_DB = 'linkedin_test'

SESSION = Session.new(TEST_DB)

class OfflineTests < Minitest::Test
  i_suck_and_my_tests_are_order_dependent!

  @@login = SESSION.login

  def setup
  end

  def test_login_visits_login_page
    @@login.login()
    assert_equal 'https://www.linkedin.com/', SESSION.session.current_url
  end

end
