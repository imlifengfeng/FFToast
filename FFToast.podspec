Pod::Spec.new do |s|
  s.name         = 'FFToast'
  s.version      = '1.1.0'
  s.summary      = 'message notification for iOS.'
  s.description  = 'A very powerful iOS message notifications and AlertView extensions. It can be easily realized from the top of the screen, the bottom of the screen and the middle of the screen pops up a notification. You can easily customize the pop-up View.'
  s.homepage     = "https://github.com/imlifengfeng/FFToast"
  s.screenshots  = 'http://www.imlifengfeng.com/blog/wp-content/uploads/2017/02/fftoast_img1.png', 'http://www.imlifengfeng.com/blog/wp-content/uploads/2017/02/fftoast_img2.png', 'http://www.imlifengfeng.com/blog/wp-content/uploads/2017/02/fftoast_img3.png', 'http://www.imlifengfeng.com/blog/wp-content/uploads/2017/02/fftoast_img4.png', 'http://www.imlifengfeng.com/blog/wp-content/uploads/2017/02/fftoast_img5.png'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "imlifengfeng" => "imlifengfeng@gmail.com" }
  s.source       = { :git => 'https://github.com/imlifengfeng/FFToast.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'FFToast/FFToast/Classes/*.{h,m}','FFToast/FFToast/Category/*.{h,m}'
  s.resource_bundles = {
    'FFToast' => ['FFToast/Assets/*.png']
  }

end
