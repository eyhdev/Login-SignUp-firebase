//
//  OnboardingView.swift
//  Login-SignUp
//
//  Created by eyh.mac on 21.01.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var currentPage: Int = 0
    @State private var showLogin: Bool = false
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                TabView(selection: $currentPage) {
                    OnboardingPage(title: "Farm Milk", description: "Organically farmed natural milk from healthy-fed cows is unprocessed and additive-free. It mirrors the animals' natural habits, providing rich nutrients like calcium, protein, B vitamins, and essential minerals.", imageName: "img1")
                        .tag(0)
                    
                    OnboardingPage(title: "Farm Cabbage", description: "Cabbage is a leafy green, red, or white vegetable that is packed with nutrients, including vitamins C and K, fiber, and antioxidants. It is a popular ingredient in many cuisines around the world and can be enjoyed raw, cooked, or fermented.", imageName: "img2")
                        .tag(1)
                    
                    // Add more onboarding pages if needed.
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                PageControl(numberOfPage: 2, currentPage: $currentPage)
                    .padding(.vertical, 20)
                
                if currentPage == 1 {
                    Button(action: {
                        showLogin = true
                    }){
                        Text("Login")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    .padding()
                    .fullScreenCover(isPresented: $showLogin) {
                        LoginPage()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    struct OnboardingPage: View {
        
        var title: String
        var description: String
        var imageName: String
        
        var body: some View {
            VStack{
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 330)
                
                Text(title)
                    .font(Font.custom("Bebas Neue", size: 55))
                    .bold()
                    .padding(.bottom, 10)
                
                Text(description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    
            }
            .padding()
        }
    }
    
 
}
struct PageControl: View {
    
    var numberOfPage: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack{
            ForEach(0..<numberOfPage) { page in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(page == self.currentPage ? .blue : .gray)
                
            }
        }
    }
}
#Preview {
    OnboardingView()
}
