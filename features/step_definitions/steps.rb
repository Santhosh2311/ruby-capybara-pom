Given /^I visit cyclos demo page$/ do
  visit $config["applicationURL"]
end

When /^I click "([^"]*)"$/ do |link|
  @screen.home_page.clickLinks(link)
end

Then /^I go to tab "([^"]*)"$/ do |tabName|
  @screen.home_page.navigateTabs(tabName)
end

And /^I Navigate back$/ do
  page.go_back
end

And /^I should see title "([^\"]*)"$/ do |titles|
    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until { page.driver.browser.title.start_with? titles }
    title1 = page.driver.browser.title
    expect(title1).to eq(titles)
end

And /^I login with credentials$/ do |table|
  userName = table.raw[1][0]
  password = table.raw[1][1]
  @screen.home_page.cyclosLogin(userName,password)
end

And /^I validate message in page "([^\"]*)"$/ do |msg|
  expect(page).to have_content(msg)
end

And /^I Logout of Application$/ do
@screen.home_page.clickLinks("Logout")
end
