require File.join(File.dirname(__FILE__), "test_helper")

class TestPassthroughUri < Test::Unit::TestCase

  def setup
    FakeWeb.allow_net_connect = false
  end

  def test_passthrough_uri_allows_the_request
    FakeWeb.passthrough_uri(:get, "http://images.apple.com/main/rss/hotnews/hotnews.rss")
    setup_expectations_for_real_apple_hot_news_request
    Net::HTTP.get(URI.parse("http://images.apple.com/main/rss/hotnews/hotnews.rss"))
  end

  def test_passthrough_uri_allows_the_request_using_a_regexp
    FakeWeb.passthrough_uri(:get, %r{^http://images.apple.com/})
    setup_expectations_for_real_apple_hot_news_request
    Net::HTTP.get(URI.parse("http://images.apple.com/main/rss/hotnews/hotnews.rss"))
  end

end
