Pod::Spec.new do |spec|
  spec.name         = "guise"
  spec.version      = "0.0.1"
  spec.summary      = "Collection of ui elements and helpers"
  spec.homepage     = "https://github.com/AntonBelousov/guise"
  spec.license      = { :type => "MIT" }
  spec.author       = { "AB" => "antbelousov@gmail.com" }
  
  spec.requires_arc = true
  spec.platform     = :ios
  spec.platform     = :ios, "12.0"
  spec.swift_version = '5.5'

  spec.source       = { :git => "https://github.com/AntonBelousov/guise.git", :tag => "#{spec.version}" }
  spec.source_files  = "*.swift"

  spec.subspec 'snapkit' do |sspec|
    sspec.source_files = 'snapkit/*.swift'
    spec.dependency 'SnapKit'
  end

end
