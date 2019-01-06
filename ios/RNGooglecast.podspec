require 'json'

package = JSON.parse(File.read(File.join(__dir__, '../package.json')))

Pod::Spec.new do |s|
  s.name         = "RNGooglecast"
  s.version      = package['version']
  s.summary      = package['description']
  s.homepage     = "https://github.com/nanndoj/react-native-googlecast"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/nanndoj/react-native-googlecast.git", :tag => "master" }
  s.source_files  = "**/*.{h,m}"
  s.requires_arc = true

  s.dependency "google-cast-sdk"

end

  