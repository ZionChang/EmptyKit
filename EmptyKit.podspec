#
#  Be sure to run `pod spec lint EmptyKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "EmptyKit"
  s.version      = "4.2.0"
  s.summary      = "A lightweight, swift library for displaying emptyView whenever the view(tableView/collectionView) has no content to display, just like DZNEmptyDataSet."
  s.homepage     = "https://github.com/ZionChang/EmptyKit"
  s.license       = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "archerzz" => "archerzz.work@gmail.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/ZionChang/EmptyKit.git", :tag => s.version }
  s.source_files  = 'EmptyKit/*.swift'
  s.requires_arc = true
  s.framework = "UIKit"
  

end
