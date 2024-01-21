//
//  CreateAccountPage.swift
//  Login-SignUp
//
//  Created by eyh.mac on 21.01.2024.
//

import SwiftUI
import FirebaseAuth

struct CreateAccountPage: View {
    
    @Binding var isCreateAccountSheetPresented: Bool
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var verifyPassword: String = ""
    @State private var errorMessage: String?
    
    var body: some View {
        VStack{
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 20)
            
            SecureField("Verify Password", text: $verifyPassword)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 20)
            
            Button(action: {
               createAccount()
            }, label: {
                Text("Sign Up")
                    .foregroundColor(.black)
                    .padding()
                    .cornerRadius(10)
                
            })
            .disabled(!passwordsMatch())
            .opacity(passwordsMatch() ? 1.0 : 0.5)
            
            Spacer()
            
            Button(action: {
                isCreateAccountSheetPresented.toggle()
            }) {
                Text("Cancel")
                    .foregroundColor(.blue)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .onDisappear {
            if !isCreateAccountSheetPresented {
                navigateToContentView()
            }
        }
    }
    func createAccount() {
        // Firebase ile yeni hesap oluşturma işlemi
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
                print("Sign-up error: \(error.localizedDescription)")
            } else {
                // Hesap oluşturma başarılı
                print("Sign-up successful")
                // İsteğe bağlı olarak başka bir sayfaya geçiş yapabilirsiniz.
                isCreateAccountSheetPresented.toggle()
            }
        }
    }
    
    func passwordsMatch() -> Bool {
        return password == verifyPassword && !password.isEmpty
    }
    
    func navigateToContentView() {
        // Navigate to ContentView
        let contentView = ContentView()
        UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: contentView)
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

struct CreateAccountPage_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountPage(isCreateAccountSheetPresented: .constant(false))
    }
}
