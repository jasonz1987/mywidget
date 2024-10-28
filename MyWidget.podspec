Pod::Spec.new do |s|
  s.name             = 'MyWidget'
  s.version          = '1.0.0'
  s.summary          = 'A short description of MyWidget.'

  s.description      = <<-DESC
  A longer description of MyWidget.
  DESC

  s.homepage         = 'https://github.com/yourusername/MyWidget'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your.email@example.com' }
  s.source           = { :git => 'https://github.com/jasonz1987/MyWidget.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'mywidget/**/*'
  s.resources = 'mywidget/**/*'

 s.frameworks = 'SwiftUI', 'WidgetKit'
end
