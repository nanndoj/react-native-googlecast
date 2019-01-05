
Pod::Spec.new do |s|
  s.name         = "RNGooglecast"
  s.version      = "1.0.0"
  s.summary      = "RNGooglecast"
  s.description  = <<-DESC
                  RNGooglecast
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNGooglecast.git", :tag => "master" }
  s.source_files  = "RNGooglecast/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "google-cast-sdk"

end

  