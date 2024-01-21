//
//  LaunchScreen.swift
//  Login-SignUp
//
//  Created by eyh.mac on 21.01.2024.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
      Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 400, height: 400)
    }
}

#Preview {
    LaunchScreen()
}
