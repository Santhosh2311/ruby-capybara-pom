class CucumberWeb

def build_page page_class_name
  page_class_name.new
end

def home_page
  @home_page ||= build_page Homepage
end

end
