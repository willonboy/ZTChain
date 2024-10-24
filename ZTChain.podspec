Pod::Spec.new do |s|
  s.name             = 'ZTChain'
  s.version          = '1.0.2'
  s.summary          = 'A simple library for chaining syntax in Swift.'

  s.description      = <<-DESC
                        ZTChain is a lightweight library designed to facilitate chaining syntax in Swift, making your code more readable and expressive.
                        DESC

  s.homepage         = 'https://github.com/willonboy/ZTChain'
  s.license          = { :type => 'MPL-2.0', :file => 'LICENSE' }
  s.author           = { 'trojan zhang' => 'willonboy@qq.com' }
  s.source           = { :git => 'https://github.com/willonboy/ZTChain.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.source_files = 'Sources/ZTChain/**/*.{swift,h,m}'
  s.exclude_files = 'Sources/Exclude'

  s.platforms = { :ios => '11.0', :osx => '10.15' }

  s.swift_version = '4.2'
end
