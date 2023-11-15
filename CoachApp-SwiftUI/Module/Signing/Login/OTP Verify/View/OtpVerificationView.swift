//
//  OtpVerificationView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 04/04/23.
//

import SwiftUI
enum OtpType {
    case forgot
    case register
}

struct OtpVerificationView: View {
    @StateObject var viewModel = OTPVerifyViewModel()
    @State var emailPhoneText : String = ""
    @State var toastBool : Bool = false
    @State var otpType : OtpType = .forgot
    var headingText : String = "OTP Verification"
    var body: some View {
        ZStack {
            Image("icMainBg")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 10) {
                NavigationBarView(text: "")
                OtpVerifyText(text: $emailPhoneText, headingText: headingText)
                OptFieldSetupView(viewModel: viewModel)
                TimerView()
                Spacer()
                OtpSubmitView(viewModel: viewModel,toastBool: $toastBool, otpType: $otpType, text: $emailPhoneText)
            }
            .padding(.horizontal,20)
            VStack(alignment: .center) {
                if toastBool {
                    ToastMessage(req: $toastBool, text: "Please Enter Correct OTP")
                }
            }
            .animation(.linear, value: toastBool)
        }
        .hideKeyboardWhenTappedAround()
        .navigationTitle("")
        .toolbar(.hidden)
 
    }
}

struct OtpVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OtpVerificationView()
    }
}

struct OtpVerifyText: View {
    @Binding var text: String
    var headingText: String = ""
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(headingText.uppercased())
                .font(.custom("Opeln2001 Szeroki Metro", size: 30))
                .foregroundColor(.white)
            Text("An One Time Password was sent please enter the OTP in order to verify your email")
                .font(.custom("Poppins-Regular", size: 14)) +
            Text(" \(text)")
                .font(.custom("Poppins-SemiBold", size: 15))
                .foregroundColor(.yellow)
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .padding(.top,72)
    }
}

struct OtpSubmitView: View {
    @ObservedObject var viewModel: OTPVerifyViewModel
    var otp = "0000"
    @State var pushToReset: Bool = false
    @Binding var toastBool : Bool
    @Binding var otpType : OtpType
    @Binding var text: String

    var body: some View {
        VStack {
            if viewModel.otpField.count > 3 {
                Button(action: {
                    viewModel.verifyOtp(phoneNumber: text, otp: viewModel.otpField)
                    viewModel.otpVerificationSuccess = {
                        pushToReset.toggle()
                        print("Sucessssss")
                    }
                    viewModel.otpVerificationFailed = {
                        toastBool = true
                    }
//                    if viewModel.otpField == otp {
//                        pushToReset.toggle()
//                    } else {
//                        toastBool = true
//                    }
                })
                {
                    YellowButtonView(text: "Submit".uppercased())
                }
                .navigationDestination(isPresented: $pushToReset) {
                    if otpType == .forgot {
                        ResetPasswordView()
                    } else {
                        
                    }
                }
                .padding(.bottom,20)
            } else {
                Button(action: {
                    
                }) {
                    GreyButtonView(text: "Submit".uppercased())
                }
                .padding(.bottom,20)
                .disabled(true)
            }
        }
    }
}

struct OptFieldSetupView: View {
    
    @ObservedObject var viewModel: OTPVerifyViewModel
    @FocusState var keyboardFocused: Bool

    var body: some View {
        VStack {
            ZStack {
                HStack (spacing: 15){
                    viewModel.otpText(text: viewModel.otp1)
                    viewModel.otpText(text: viewModel.otp2)
                    viewModel.otpText(text: viewModel.otp3)
                    viewModel.otpText(text: viewModel.otp4)
                }
                TextField("", text: $viewModel.otpField)
                    .frame(width: 46*4 + 15*3, height: 60)
                    .disabled(viewModel.isTextFieldDisabled)
                    .textContentType(.oneTimeCode)
                    .foregroundColor(.clear)
                    .accentColor(.clear)
                    .background(Color.clear)
                    .keyboardType(.numberPad)
                    .focused($keyboardFocused)
                    .onAppear() {
                        keyboardFocused = true
                    }
            }
        }
    }
}

struct TimerView: View {
    let initialSeconds = 30
    @State var remainingSeconds: Int = 30
    @State var isTimerRunning = true
    var timer: Timer {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if remainingSeconds > 0 {
                    remainingSeconds -= 1
                } else {
                    isTimerRunning = false
                    self.timer.invalidate()
                }
            }
        }
    var body: some View {
        HStack {
            if isTimerRunning {
                Text("\(formatTime(seconds: remainingSeconds))")
                    .font(.custom("Poppins-Medium", size: 12))
                    .foregroundColor(Color.init(red: 85/255, green: 226/255, blue: 99/255))
            }
            Button(action: {
                remainingSeconds = initialSeconds
                isTimerRunning = true
            }) {
                Text("resend code".uppercased())
                    .font(.custom("Poppins-Medium", size: 12))
                    .foregroundColor(isTimerRunning ? Color.init(red: 208/255, green: 155/255, blue: 41/255, opacity: 0.5) : Color.init(red: 208/255, green: 155/255, blue: 41/255))
            }
            .padding()
            .disabled(isTimerRunning)
        }
        .onAppear {
            _ = timer
        }
    }
    
    func formatTime(seconds: Int) -> String {
           let minutes = seconds / 60
           let remainingSeconds = seconds % 60
           return String(format: "%02d:%02d", minutes, remainingSeconds)
       }
}
