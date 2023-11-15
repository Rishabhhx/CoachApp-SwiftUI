//
//  ResetPasswordView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 10/04/23.
//

import SwiftUI

struct ResetPasswordView: View {
    @State var newPassword : String = ""
    @State var confirmNewPassword : String = ""

    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(text: "")
            ResetContentView()
                .padding(.top, 88)
            VStack(spacing: 15) {
                TextfieldLoginView(text: $newPassword, showText: false, placeHolderText: "Enter New Password")
                TextfieldLoginView(text: $confirmNewPassword, showText: false, placeHolderText: "Confirm New Password")
            }
            .foregroundColor(.white)
            .padding(.top, 60)
            Spacer()
            ManageResetSubmit(newPassword: $newPassword, confirmNewPassword: $confirmNewPassword)
        }
        .animation(.linear, value: [newPassword,confirmNewPassword])
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("icMainBg")
            .resizable()
            .ignoresSafeArea())
        .hideKeyboardWhenTappedAround()
        .navigationTitle("")
        .toolbar(.hidden)
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}

struct ResetContentView: View {
    var heading : String = "Reset Password"
    var subHeading : String = "Please Set New Password"
    
    var body: some View {
        VStack(spacing: 0) {
            Text(heading.uppercased())
                .foregroundColor(.white)
                .font(.custom("Opeln2001 Szeroki Metro", size: 30))
            Text(subHeading)
                .foregroundColor(.white)
                .font(.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .padding(.top, 15)
                .padding(.horizontal,20)
        }
    }
}

struct ManageResetSubmit: View {
    @Binding var newPassword : String
    @Binding var confirmNewPassword : String
    @State var pushBackToLogin: Bool = false

    var body: some View {
        VStack {
            if newPassword.count > 7 && newPassword == confirmNewPassword {
                Button(action: {
                    pushBackToLogin.toggle()
                }) {
                    YellowButtonView(text: "SUBMIT")
                }
                .navigationDestination(isPresented: $pushBackToLogin) {
                    LoginNowView()
                }
            } else {
                Button(action: {}) {
                    GreyButtonView(text: "SUBMIT")
                }
                .disabled(true)
            }
        }
        .animation(nil, value: UUID())
        .padding(.bottom, 20)
    }
}

