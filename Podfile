platform :ios, '13.0'

target 'CoffeShop-iOS' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CoffeShop-iOS
  # Firebase
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  ## for codable extensions
  pod 'FirebaseFirestoreSwift', '8.5.0-beta'
  # Kingfisher
  pod 'Kingfisher', '~> 6.0'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end
end
