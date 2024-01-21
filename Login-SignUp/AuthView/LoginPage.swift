//
//  LoginPage.swift
//  Login-SignUp
//
//  Created by eyh.mac on 21.01.2024.
//

import SwiftUI
import FirebaseAuth

struct IdentifiableError: Identifiable {
    
    var id: UUID = UUID()
    var message: String
    
}

struct LoginPage: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isCreateAccountSheetPresented: Bool = false
    @State private var isLogged: Bool = false
    @State private var errorMessage: IdentifiableError?
    
    var body: some View {
        NavigationView{
            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 50)
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
                
                NavigationLink(destination: CreateAccountPage(isCreateAccountSheetPresented: $isCreateAccountSheetPresented),
                    isActive: $isCreateAccountSheetPresented) {
                    
                    EmptyView()
                }
                
                Button(action: {
                    login()
                }, label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                })
                .padding(.bottom, 10)
                
                Button(action: {
                    isCreateAccountSheetPresented.toggle()
                }, label: {
                    Text("SignUp")
                        .foregroundColor(.gray)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                })
                .padding(.bottom, 10)
                Spacer()
            }
            .padding()
            .navigationBarTitle("Welcome")
        }
    }
    
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = IdentifiableError(message: error.localizedDescription)
                print("Login error: \(error.localizedDescription)")
            } else {
                print("Login successful")
                isLogged = true
                navigateToContentView()
            }
        }
    }

    func navigateToContentView() {
        // Navigate to ContentView
        let contentView = ContentView()
        UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: contentView)
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}


#Preview {
    LoginPage()
}
