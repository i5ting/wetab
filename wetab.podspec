Pod::Spec.new do |s|
  s.name     = 'wetab'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'a iOS tabbar.'
  s.homepage = 'https://github.com/i5ting/wetab'
  s.author   = { 'alfred sang' => 'shiren1118@126.com' }
  s.social_media_url = "http://twitter.com/i5ting"

  s.source   = { :git => 'https://github.com/i5ting/wetab.git'}

  s.description = %{
    wetab is a iOS tabbar component.
    wetab supports iOS.
  }

  pch_AF = <<-EOS
    #ifndef TARGET_OS_IOS
        #define TARGET_OS_IOS TARGET_OS_IPHONE
    #endif
    #ifndef TARGET_OS_TV
        #define TARGET_OS_TV 0
    #endif
  EOS

  s.source_files = 'Wetab/*.{h,m}'

  s.ios.frameworks = 'Foundation', 'UIKit'

  s.ios.deployment_target = '6.0' # minimum SDK with autolayout
  s.requires_arc = true
end