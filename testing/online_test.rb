require "minitest/autorun"

require_relative '../rubyscripts/session'
require_relative '../rubyscripts/archivist'

TEST_DB = 'linkedin_test'

SESSION = Session.new(TEST_DB)

class OfflineTests < Minitest::Test
  i_suck_and_my_tests_are_order_dependent!

  @@login = Login.new(SESSION.session, SESSION.archivist)

  def setup
  end

  def test_a_login_visits_login_page
    @@login.visit_login_page()
    assert_equal 'https://www.linkedin.com/uas/login', SESSION.session.current_url()
    assert_match /forgot password/i, SESSION.session.html()
  end

  def test_b_login_fills_and_submits
    @@login.fill_details()
    assert_match'https://www.linkedin.com/feed/', SESSION.session.current_url()
    assert_match /try premium/i, SESSION.session.html()
    assert_match /me/i, SESSION.session.html()
  end
end
