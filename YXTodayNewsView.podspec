Pod::Spec.new do |s|
  s.name         = "YXTodayNewsView"
  s.version      = "0.0.1"
  s.summary      = "With YXTodayNewsView, you can easily create today news in your apps."
  s.homepage     = "https://github.com/minaisland/YXTodayNewsView.git"
  s.license      = { :type => 'MIT License', :file => 'LICENSE' }
  s.author       = { "minaisland" => "konaod@gmail.com" }
  s.platform     = :ios, '9.0'
  s.source       = { :git => "https://github.com/minaisland/YXTodayNewsView.git", :branch => "main" }
  s.source_files  = "YXTodayNewsView/*.{h,m}","YXTodayNewsView/*/*.{h,m}"
#  s.resource = "YXTodayNewsView/Resources/*.xcassets"
  s.resource_bundles = {"Resources" => ["YXTodayNewsView/Resources/*.xcassets"]}
  s.requires_arc = true
  s.dependency 'SDWebImage', '5.18.3'
end
