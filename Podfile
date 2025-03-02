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
    pod 'FirebaseCore'
    pod 'R.swift'
    pod 'IQKeyboardManagerSwift'
    pod 'Kingfisher'
    pod 'lottie-ios'
    pod 'SnapKit'
    pod 'Firebase/Auth'
    pod 'GoogleSignIn'
    pod 'FBSDKLoginKit'
    pod 'GoogleSignInSwiftSupport'
    # Pods for SavingMoney
  # Pods for SavingMoney

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'BoringSSL-GRPC'
      target.source_build_phase.files.each do |file|
        if file.settings && file.settings['COMPILER_FLAGS']
          flags = file.settings['COMPILER_FLAGS'].split
          flags.reject! { |flag| flag == '-GCC_WARN_INHIBIT_ALL_WARNINGS' }
          file.settings['COMPILER_FLAGS'] = flags.join(' ')
        end
      end
    end
  end
end
