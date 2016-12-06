RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include IntegrationSpecHelper, :type => :request
end

Capybara.default_host = 'http://example.org'

OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:github, {
  :uid => '12345'
  :name => 'Julio'
})
