Pod::Spec.new do |s|
	s.name     = 'BKUIColorAdditions'
	s.version  = '1.0'
	s.authors   = { 'Bruno Koga' => 'koga@brunokoga.com' }
	s.homepage = 'https://github.com/brunokoga/BKUIColorAdditions'
	s.summary  = 'Additions to UIKit'
	s.license  = 'MIT'
	s.source   = { :git => 'https://github.com/brunokoga/BKUIColorAdditionsi.git' }
	s.source_files = 'BKUIColorAdditions'
	s.platform = :ios
	s.ios.deployment_target = '5.0'
	s.requires_arc = true
end
