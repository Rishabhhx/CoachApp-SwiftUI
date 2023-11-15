//
//  RegisterView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 05/04/23.
//

import SwiftUI

struct RegisterView: View {
    @State var nameText : String = ""
    @State var emailText : String = ""
    @State var phoneText : String = ""
    @State var passwordText : String = ""
    @State var agreeSelected : Bool = false
    @State var presentVerification : Bool = false
    @State var pushToOtp : Bool = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing:0) {
                    NavigationBarView(text: "Register")
                    RegisterTextFieldSetup(nameText: $nameText, emailText: $emailText, phoneText: $phoneText, passwordText: $passwordText)
                    AgreeButtonView(agreeSelected: $agreeSelected)
                    SignUpButtonManage(nameText: $nameText, emailText: $emailText, phoneText: $phoneText, passwordText: $passwordText, agreeSelected: $agreeSelected, presentVerification: $presentVerification)
                    HStack(spacing: 0) {
                        Text("Already a member?")
                            .font(.custom("Poppins-SemiBold", size: 16))
                        Text(" Sign In")
                            .font(.custom("Poppins-SemiBold", size: 16))
                            .foregroundColor(.yellow)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                    .padding(.vertical,35)
                    .foregroundColor(.white)
                }
            }
            .sheet(isPresented: $presentVerification) {
                VerificationLinkView(nextButtonPressed: {
                    pushToOtp.toggle()
                })
                    .background(ClearBackgroundView())
                    .presentationDetents([.customSmall])
            }
            .navigationDestination(isPresented: $pushToOtp) {
                OtpVerificationView(otpType: .register, headingText: "We’ve sent a four digit OTP to".uppercased())
            }
            .padding(.horizontal,20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("icMainBg")
                .resizable()
                .ignoresSafeArea())
            .animation(.linear, value: [nameText,emailText,phoneText,passwordText])
            .modifier(BaseCustomModifier())
            VStack {
                if presentVerification {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.black.opacity(0.7))
                        .ignoresSafeArea()
                }
            }
            .animation(.easeIn, value: presentVerification)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct AgreeButtonView: View {
    
    @Binding var agreeSelected : Bool
    
    var body: some View {
        HStack(alignment: .top,spacing: 10) {
            Button(action: {
                agreeSelected.toggle()
            }) {
                Image(agreeSelected ? "group9797" : "icRadioDeselect")
            }
            Text("I am Agree to ")
                .font(.custom("Poppins-Regular", size: 14))
                .foregroundColor(.white) +
            Text("Privacy Policy")
                .font(.custom("Poppins-SemiBold", size: 14))
                .underline()
                .foregroundColor(Color.init(red: 208/255, green: 155/255, blue: 21/255)) +
            Text(" and ")
                .font(.custom("Poppins-Regular", size: 14))
                .foregroundColor(.white) +
            Text("Terms & Conditions")
                .font(.custom("Poppins-SemiBold", size: 14))
                .underline()
                .foregroundColor(Color.init(red: 208/255, green: 155/255, blue: 21/255))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top,30)
    }
}

struct SignUpButtonManage: View {
    
    @Binding var nameText : String
    @Binding var emailText : String
    @Binding var phoneText : String
    @Binding var passwordText : String
    @Binding var agreeSelected : Bool
    @Binding var presentVerification: Bool
    var body: some View {
        VStack {
            if (nameText.count < 4 || passwordText.count < 9 || !emailText.isValidEmail || !phoneText.numberValidation || !agreeSelected) {
                GreyButtonView(text: "sign up".uppercased())
                    .padding(.top, 50)
            } else {
                Button(action: {
                    presentVerification.toggle()
                }) {
                    YellowButtonView(text: "sign up".uppercased())
                        .padding(.top, 50)
                }
            }
        }
        .animation(nil, value: UUID())
    }
}

extension PresentationDetent {
    static let customSmall = Self.height(360)
}

struct RegisterTextFieldSetup: View {
    @Binding var nameText : String
    @Binding var emailText : String
    @Binding var phoneText : String
    @Binding var passwordText : String
    var body: some View {
        VStack(spacing:15) {
            TextfieldLoginView(text: $nameText,showEye: false,placeHolderText: "Full Name")
            TextfieldLoginView(text: $emailText,showEye: false,placeHolderText: "Email Address")
            TextfieldLoginView(text: $phoneText,showEye: false,placeHolderText: "Phone Number")
                .keyboardType(.numberPad)
            TextfieldLoginView(text: $passwordText,showEye: true,placeHolderText: "Enter Password")
        }
        .foregroundColor(.white)
        .padding(.top,56)
    }
}
