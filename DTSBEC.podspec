
Pod::Spec.new do |s|
  s.name             = "DTSBEC"
  s.version          = "0.1.2"
  s.summary          = "modularization BEC Proxy used on iOS."
  s.description      = <<-DESC
                       It is a modularization BEC proxy used on iOS, which implement by Objective-C.
                       DESC
  s.homepage         = "https://github.com/dengtacj/DTSBEC"
  s.license          = 'MIT'
  s.author           = { "waynett" => "wanww2011@gmail.com" }
  s.source           = { :git => "https://github.com/dengtacj/DTSBEC.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'DTSBEC/**/*.{h,m}'
  s.public_header_files = 'DTSBEC/**/*.h'

  s.dependency 'DTSThoth'

  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
end
