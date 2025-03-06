//
//  AuthenService.swift
//  SavingMoney
//
//  Created by Tuấn Nguyễn on 20/1/25.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices

class AuthenService {
    static let shared = AuthenService()
    
    // Sign in with email and password
    func signInWithEmailPassword(email: String,
                                 password: String,
                                 completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let errorCode = (error as NSError).code
                
                switch errorCode {
                case AuthErrorCode.invalidEmail.rawValue:
                    completion(false, R.l10n.theEmailAdressIsBadlyFormated())
                case AuthErrorCode.userNotFound.rawValue:
                    completion(false, R.l10n.noUserWithEmail())
                default:
                    completion(false, R.l10n.incorrectLoginOrPassword())
                }
                return
            }
            
            print("Successfully signed in with email: \(email)")
            completion(true, nil)
        }
    }
    
    // Sign up with email and password
    func signUpWithEmailPassword(email: String,
                                 password: String,
                                 confirmPassword: String,
                                 completion: @escaping (Bool, String?) -> Void) {
        guard password == confirmPassword else {
            completion(false, R.l10n.passwordNoMatch())
            return
        }
        
        Auth.auth().createUser(withEmail: email,
                               password: password) { authResult, error in
            if let error = error {
                let errorCode = (error as NSError).code
                
                switch errorCode {
                case AuthErrorCode.invalidEmail.rawValue:
                    completion(false, R.l10n.theEmailAdressIsBadlyFormated())
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    completion(false, R.l10n.theEmailAdressIsUsed())
                case AuthErrorCode.weakPassword.rawValue:
                    completion(false, R.l10n.passwordIsTooWeak())
                default:
                    completion(false, R.l10n.accountCreationFaild())
                }
                return
            }
            
            print("Successfully signed up with email: \(email)")
            completion(true, nil)
        }
    }
    
    func signInWithGoogle(completion: @escaping (Bool, String?) -> Void) {
        guard let presentingViewController = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.keyWindow?.rootViewController else {
            completion(false, "Unable to find root view controller.")
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
            if let error = error {
                print("Google sign-in failed: \(error.localizedDescription)")
                completion(false, error.localizedDescription)
                return
            }
            
            guard
                let user = result?.user,
                let idToken = user.idToken?.tokenString
            else {
                print("Google authentication failed.")
                completion(false, "Google authentication failed.")
                return
            }
            
            let accessToken = user.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase sign-in with Google failed: \(error.localizedDescription)")
                    completion(false, error.localizedDescription)
                    return
                }
                print("Successfully signed in with Google: \(user.profile?.email ?? "")")
                completion(true, nil)
            }
        }
    }
    
    
    func signInWithAnonymous(completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().signInAnonymously { authResult, error in
            if let error = error {
                print("Failed to sign in anonymously: \(error.localizedDescription)")
                completion(false, error.localizedDescription)
                return
            }
            print("Successfully signed in anonymously with user ID: \(authResult?.user.uid ?? "")")
            completion(true, nil)
        }
    }
    
    func sendPasswordReset(email: String, completion: @escaping (Bool, String?) -> Void) {
        
    }
}
