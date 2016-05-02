Pod::Spec.new do |s|
  s.name         = "APSwiftHelpers"
  s.version      = "0.0.2"
  s.summary      = "Helper functions for developing Swift Cocoa Touch apps"
  s.description  = "Helper functions for developing Swift Cocoa Touch apps"
  s.homepage     = "https://github.com/alexpls/APSwiftHelpers"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author       = { "Alex Plescan" => "alex@alexplescan.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/alexpls/APSwiftHelpers.git", :tag => "0.0.2" }
  s.source_files = "APSwiftHelpers/*.swift"
  s.requires_arc = true
end
