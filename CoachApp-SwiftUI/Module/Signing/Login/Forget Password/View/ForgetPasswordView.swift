//
//  ForgetPasswordView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 03/04/23.
//

import SwiftUI

struct ForgetPasswordView: View {
    @State var emailPhoneText: String = ""
    @State var pushToOtp: Bool = false
    @StateObject var viewModel = ForgetViewModel()

    var body: some View {
        ZStack {
            Image("icMainBg")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 10) {
                NavigationBarView(text: "")
                ForgetPasswordText()
                TextfieldLoginView(text: $emailPhoneText, showEye: false)
                    .foregroundColor(.white)
                Spacer()
                ManageForgetSubmitView(push: $pushToOtp, viewModel: viewModel, emailPhoneText: $emailPhoneText, text: emailPhoneText)
            }
            .padding(.horizontal,20)
            .animation(.linear, value: emailPhoneText)
        }
        .hideKeyboardWhenTappedAround()
        .navigationTitle("")
        .toolbar(.hidden)
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}

struct ForgetPasswordText: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("FORGET PASSWORD")
                .font(.custom("Opeln2001 Szeroki Metro", size: 30))
                .foregroundColor(.white)
            Text("Enter the Email or Mobile No. associated with your Coaches account & we will send a Reset Password link or OTP in order to reset your password")
                .multilineTextAlignment(.center)
                .font(.custom("Poppins-Regular", size: 14))
                .foregroundColor(.white)
        }
        .padding(.top,72)
    }
}

struct ManageForgetSubmitView: View {
    @Binding var push : Bool
    @ObservedObject var viewModel: ForgetViewModel
    @Binding var emailPhoneText: String

    var text : String = ""
    var body: some View {
        VStack {
            if (text.isValidEmail || text.numberValidation) {
                Button(action: {
                    viewModel.sendSms(phoneNumber: emailPhoneText)
                    viewModel.sendSmsClosure = {
                        print("Sucessssss")
                        push.toggle()
                    }
                    viewModel.sendSmsFailed = {
                        print("Faillll")

                    }
                }) {
                    YellowButtonView(text: "Submit".uppercased())
                }
                .navigationDestination(isPresented: $push) {
                    OtpVerificationView(emailPhoneText: text)
                }
                .padding(.bottom,20)
            } else {
                Button(action: {}) {
                    GreyButtonView(text: "Submit".uppercased())
                }
                .padding(.bottom,20)
                .disabled(true)
            }
        }
        .animation(nil, value: UUID())

        
    }
}
