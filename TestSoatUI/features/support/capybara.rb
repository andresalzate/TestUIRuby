case ENV['BROWSER']
when 'pg'
  BROWSER = :poltergeist
  Capybara.default_max_wait_time = 90
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
    app,
    inspector: true,
    js_errors: false,
    window_size: [1280, 1024],
    phantomjs_options: ['--ignore-ssl-errors=yes', '--ssl-protocol=tlsv1'],
    debug: false
    )
  end
  Capybara.default_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
  Capybara.ignore_hidden_elements = false
  #Capybara.default_selector = :css
when 'firefox'
  BROWSER = :firefox
  Capybara.register_driver :selenium do |app|
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['network.proxy.type'] = 3
    # Configure proxy manually.
    # No proxy = 3
    # Auto-detect proxy = 4
    # Use system proxy settings = 5
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 120
    Capybara::Selenium::Driver.new(app, browser: :firefox, profile: profile, http_client: client)
  end
  Capybara.run_server = false
  Capybara.default_driver = :selenium
  Capybara.page.driver.browser.manage.window.maximize
when 'remote'
  url = 'http://selenium-hub.youse.io:4444/wd/hub' # hub address
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
  'chromeOptions' => {"args" => ["--disable-gpu", "--no-sandbox", "--window-size=1280,1024"]})
  Capybara.register_driver :remote_browser do |app|
    Capybara::Selenium::Driver.new(app,
    :browser => :remote, :url => url,
    :desired_capabilities => capabilities)
  end
  Capybara.default_driver = :remote_browser
  Capybara.default_max_wait_time = 10
  Capybara.javascript_driver = :remote_browser
else
  BROWSER = :chrome

  Capybara.register_driver :chrome do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--start-maximized" ]})
    Capybara::Selenium::Driver.new(app, {:browser => :chrome, :desired_capabilities => caps})
  end
  Capybara.default_driver = BROWSER
  Capybara.default_max_wait_time = 10
  Capybara.javascript_driver = :webkit
  Capybara.page.driver.browser.manage.window.maximize
end
