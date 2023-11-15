//
//  SettingsView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma(Work) on 08/05/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                NavigationBarView(text: "settings")
                    .padding(.horizontal, 20)
                LazyVStack(spacing: 15) {
                    MyProfileCell(text: "About Us", image: "icAbout")
                    MyProfileCell(text: "Privacy Policy", image: "group11587")
                    MyProfileCell(text: "Help", image: "group11586")
                    MyProfileCell(text: "FAQ", image: "icFaq")
                    MyProfileCell(text: "Contact Us", image: "path89637")
                    MyProfileCell(text: "Notification Settings", image: "iconlyLightNotification")
                    MyProfileCell(text: "Terms & Condition", image: "icTC")
                }
                .padding(.top, 35)

                Text("App Version 1.0.1.0")
                    .font(.custom("Poppins-SemiBold", size: 12))
                    .foregroundColor(.white)
                    .padding(.top, 45)
                    .padding(.horizontal, 20)
                MyProfileCell(text: "Logout", image: "icLogout")
                    .padding(.top, 4)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("icMainBg")
        .resizable()
        .ignoresSafeArea())
        .modifier(BaseCustomModifier())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
