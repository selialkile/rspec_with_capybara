
RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end


# set up driver
Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    http_client: client
    options: options)
end

## set up client
require 'selenium-webdriver'
client = Selenium::WebDriver.for :chrome # see also following link.

## set up options
options = Selenium::WebDriver::Chrome::Options.new.tap do |opts|
  opts.args << '--headless'
end

# configure
Capybara.configure do |config|
  config.ignore_hidden_elements = true
  config.default_max_wait_time = 3 #sec
end
