//
//  LoginNowView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 02/04/23.
//

import SwiftUI

struct LoginNowView: View {
    
    @State var emailPhoneText: String = ""
    @State var passwordText: String = ""
    
    var body: some View {
        GeometryReader {_ in
            ZStack {
                Image("icMainBg")
                    .resizable()
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    NavigationBarView()
                    Spacer()
                    HelloView()
                    Spacer()
                    TextfieldLoginView(text: $emailPhoneText,showEye: false)
                        .padding(.bottom,15)
                        .foregroundColor(.white)
                    TextfieldLoginView(text: $passwordText,placeHolderText: "Enter your Password")
                        .foregroundColor(.white)
                    Spacer()
                    ManageLoginButton(emailPhoneText: $emailPhoneText, passwordText: $passwordText)
                        .animation(nil, value: UUID())
                    Spacer()
                    ContinueUsingView()
                        .padding(.bottom,54)
                }
                .padding(.horizontal, 20)
                .animation(.linear, value: emailPhoneText)
                .animation(.linear, value: passwordText)
            }
        }
        .modifier(BaseCustomModifier())
    }
}

struct LoginNowView_Previews: PreviewProvider {
    static var previews: some View {
        LoginNowView()
    }
}

struct HelloView: View {
    @State var pushToSignup : Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Hello,")
                .font(.custom("Poppins-SemiBold", size: 26))
            Text("Login Now")
                .font(.custom("Poppins-Light", size: 26))
            HStack(spacing: 0) {
                Text("If you are new and Not a member?")
                    .font(.custom("Poppins-SemiBold", size: 15))
                Text(" Sign Up")
                    .font(.custom("Poppins-SemiBold", size: 15))
                    .foregroundColor(.yellow)
                    .navigationDestination(isPresented: $pushToSignup) {
                        RegisterView()
                    }
                    .onTapGesture {
                        pushToSignup.toggle()
                    }
            }
        }
        .foregroundColor(.white)
    }
}

struct TextfieldLoginView: View {
    @Binding var text: String
    @State var showText : Bool = false
    
    var showEye: Bool = true
    
    var placeHolderText : String = "Login by Email or Mobile No"
    var body: some View {
        VStack(spacing: 6) {
            if !text.isEmpty {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 18)
            }
            
            ZStack(alignment: .leading) {
                Text(placeHolderText).foregroundColor(Color.init(red: 153/255, green: 153/255, blue: 153/255))
                    .padding(.leading,text.isEmpty ? 20 : 0)
                    .offset(y: text.isEmpty ? 0 : -40)
                    .font(Font.custom("Poppins-Medium", size: text.isEmpty ? 13 : 12))
                ZStack {
                    Rectangle()
                        .frame(height: 50)
                        .foregroundColor(Color.init(red: 78/255, green: 78/255, blue: 78/255,opacity: 0.3))
                        .cornerRadius(10)
                    HStack(spacing: 0) {
                        if showText || !showEye{
                            TextField("", text: $text)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .font(Font.custom("Poppins-Semibold", size: 14))
//                                .foregroundColor(.white)
                                .padding(.leading,20)
                                .tint(.white)
                        } else {
                            SecureField("", text: $text)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .font(Font.custom("Poppins-Semibold", size: 18))
//                                .foregroundColor(.white)
                                .padding(.leading,20)
                                .tint(.white)
                        }
                        if showEye {
                            Button(action: {
                                showText.toggle()
                            }) {
                                if showText {
                                    Image("icEyeOpen")
                                } else {
                                    Image("icEyeClose")
                                }
                            }
                            .frame(width: 16)
                            .padding(.horizontal,16)
                        }
                    }
                }
            }
        }
    }
}

struct ManageLoginButton: View {
    @State var pushToHome : Bool = false
    @State var pushToForget: Bool = false
    @Binding var emailPhoneText: String
    @Binding var passwordText: String
    
    var email : String = "rishabh@gmail.com"
    var phone : String = "8882194082"
    var password : String = "Dev@1234"
    
    var body: some View {
        VStack(spacing: 0) {
            if (emailPhoneText.isValidEmail || emailPhoneText.numberValidation) && passwordText.count > 7 {
                Button(action: {
                    if (emailPhoneText == email || emailPhoneText == phone) && passwordText == password {
                        pushToHome.toggle()
                    }
                }) {
                    YellowButtonView(text: "Login".uppercased())
                }
                .navigationDestination(isPresented: $pushToHome) {
                    OnboardingScreen()
                }
            } else {
                Button(action: {}) {
                    GreyButtonView(text: "Login".uppercased())
                }
                .disabled(true)
            }
            
            Button(action: {
                pushToForget.toggle()
            }) {
                Text("Forgot Password?")
                    .font(Font.custom("Poppins-Medium", size: 14))
                    .foregroundColor(Color.init(red: 198/255, green: 176/255, blue: 134/255))
            }
            .navigationDestination(isPresented: $pushToForget) {
                ForgetPasswordView()
            }
            .padding(.top, 26)
        }
    }
    
}

struct ContinueUsingView: View {
    var body: some View {
        VStack {
            ZStack {
                Text("Or Continue Using")
                    .font(Font.custom("Poppins-Medium", size: 14))
                    .foregroundColor(Color.init(red: 198/255, green: 176/255, blue: 134/255))
                    .frame(maxWidth: .infinity)
                HStack(spacing: 162){
                    Rectangle()
                        .frame(width: 35, height: 2)
                        .cornerRadius(5)
                        .foregroundColor(Color.init(red: 198/255, green: 176/255, blue: 134/255))
                    Rectangle()
                        .frame(width: 35, height: 2)
                        .cornerRadius(5)
                        .foregroundColor(Color.init(red: 198/255, green: 176/255, blue: 134/255))
                }
            }
            HStack(spacing: 30) {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    Image("icApple")
                }
                .frame(width: 54, height: 54)
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    Image("icGoogle")
                }
                .frame(width: 54, height: 54)
            }
        }
    }
}

struct BaseCustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .ignoresSafeArea(.keyboard)
            .hideKeyboardWhenTappedAround()
            .navigationTitle("")
            .toolbar(.hidden)
    }
}
