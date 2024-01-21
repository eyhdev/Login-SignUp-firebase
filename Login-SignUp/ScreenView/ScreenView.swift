//
//  ScreenView.swift
//  Login-SignUp
//
//  Created by eyh.mac on 21.01.2024.
//

import SwiftUI

struct ScreenView: View {
    @State private var isSplashActive: Bool = true
    var body: some View {
        Group {
            if isSplashActive{
                LaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isSplashActive = false
                            }
                        }
                    }
            }else {
                OnboardingView()
            }
        }
    }
}

#Preview {
    ScreenView()
}
