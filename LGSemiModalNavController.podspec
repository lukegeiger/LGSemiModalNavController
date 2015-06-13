#
# Be sure to run `pod lib lint LGSemiModalNavController.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LGSemiModalNavController"
  s.version          = "0.1.0"
  s.summary          = "A UINavigationController subclass that presents itself a dynamic amount"
  s.description      = <<-DESC
A UINavigationController subclass that presents itself a dynamic amount in a view controller using the UIViewControllerAnimatedTransitioning protocol.
                       DESC
  s.homepage         = "https://github.com/lukegeiger/LGSemiModalNavController"
  s.license          = 'MIT'
  s.author           = { "Luke Geiger" => "lukejamesgeiger@gmail.com" }
  s.source           = { :git => "https://github.com/lukegeiger/LGSemiModalNavController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/lukejgeiger'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'LGSemiModalNavController' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'

end
