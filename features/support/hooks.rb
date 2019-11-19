Before  do
  begin
    initialize_webdriver
    p "In Begin Execution"
    @screen =  CucumberWeb.new
  rescue => detail
    p detail.message
  end
end

After  do
  begin
    p "In After Execution"
  rescue => detail
    p detail.message
  end
end

After do |scenario|
    take_screenshot(scenario)
end

def initialize_webdriver
  file_path = File.expand_path(File.dirname(__FILE__) + '/../../config/cucumber.yaml')
  @config = ConfigurationHelpers.new(file_path)
  @screen = CucumberWeb.new
end

def take_screenshot(scenario)
  if scenario.failed?
     scenario_name = scenario.name.gsub /[^\w\-]/, ' '
     time = Time.now.strftime("%Y-%m-%d %H%M")
    screenshot_path = '.\features\output\media\failed_png\\' + time + ' - ' + scenario_name + '.png'
  else
    scenario_name = scenario.name.gsub /[^\w\-]/, ' '
    time = Time.now.strftime("%Y-%m-%d %H%M")
    screenshot_path = '.\features\output\media\success_png\\' + time + ' - ' + scenario_name + '.png'
  end
  page.driver.browser.save_screenshot(screenshot_path)
  embed(screenshot_path, "image/png", "SCREENSHOT")
end
