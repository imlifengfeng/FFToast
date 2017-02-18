Pod::Spec.new do |s|
  s.name         = 'FFToast'
  s.version      = '1.0.0'
  s.summary      = 'message notification for iOS.'
  s.description  = 'This is a simple extension of an iOS message notification that can be used to pop up a prompt at the top or bottom of the screen. You can customize it according to their own display.'
  s.homepage     = "https://github.com/imlifengfeng/FFToast"
  s.screenshots  = 'https://github.com/imlifengfeng/FFToast/blob/master/screenshots/screenshots_1.png', 'https://github.com/imlifengfeng/FFToast/blob/master/screenshots/screenshots_2.png', 'https://github.com/imlifengfeng/FFToast/blob/master/screenshots/screenshots_3.png', 'https://github.com/imlifengfeng/FFToast/blob/master/screenshots/screenshots_4.png', 'https://github.com/imlifengfeng/FFToast/blob/master/screenshots/screenshots_5.png'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "imlifengfeng" => "imlifengfeng@gmail.com" }
  s.source       = { :git => 'https://github.com/imlifengfeng/FFToast.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'FFToast/Classes/**/*'
  s.resource_bundles = {
    'FFToast' => ['FFToast/Assets/*.png']
  }

end
