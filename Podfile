# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SavingMoney' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'FirebaseAnalytics'
  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'
  pod 'FirebaseFirestoreSwift'
  pod 'FirebaseStorage'
  pod 'R.swift'
  pod 'IQKeyboardManagerSwift'
  pod 'Kingfisher'
  # Pods for SavingMoney
  
end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
    end
  end
end