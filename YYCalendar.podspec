#
# Be sure to run `pod lib lint YYCalendar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
	s.name             = 'YYCalendar'
	s.version          = '1.3.3'
	s.swift_version    = '5.2'
	s.summary          = 'Very Simple and Useful Calendar'

	s.description      = <<-DESC
	When you need to let users choose date from calendar. You can use YYCalendar.
	Simple And Clear 😎
	DESC

	s.homepage         = 'https://github.com/DevYeom/YYCalendar'
	s.license          = { :type => 'MIT', :file => 'LICENSE' }
	s.author           = { 'DevYeom' => 'dev.yeom@gmail.com' }
	s.source           = { :git => 'https://github.com/DevYeom/YYCalendar.git', :tag => s.version.to_s }
	s.ios.deployment_target = '10.0'
	s.source_files = 'YYCalendar/Classes/**/*'
	s.frameworks = 'UIKit'
	s.resources = 'YYCalendar/Assets/**/*'
end
