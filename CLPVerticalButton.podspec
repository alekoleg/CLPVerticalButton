#
# Be sure to run `pod lib lint CLPVerticalButton.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CLPVerticalButton"
  s.version          = "0.0.2"
  s.summary          = "CLPVerticalButton."
  s.description      = "Custom Vertical Button"
  s.homepage         = "https://github.com/alekoleg/CLPVerticalButton"
  s.license          = 'MIT'
  s.author           = { "Alekseenko Oleg" => "alekoleg@gmail.com" }
  s.source           = { :git => "https://github.com/alekoleg/CLPVerticalButton.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit'

end
