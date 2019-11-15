class ConfigurationHelpers

def initialize (file_path)
  $config = YAML.load_file(File.expand_path(file_path))
#  puts ENV['PSP']
end

end
