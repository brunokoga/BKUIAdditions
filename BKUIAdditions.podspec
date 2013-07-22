Pod::Spec.new do |s|
	s.name     = 'BKUIAdditions'
	s.version  = '1.0'
	s.authors   = { 'Bruno Koga' => 'koga@brunokoga.com' }
	s.homepage = 'https://github.com/brunokoga/BKUIAdditions'
	s.summary  = 'Additions to UIKit'
	s.license  = 'MIT'
	s.source   = { :git => 'https://github.com/brunokoga/BKUIAdditions.git' }
	s.source_files = 'BKUIAdditions'
	s.platform = :ios
	s.ios.deployment_target = '5.0'
	s.requires_arc = true
end
