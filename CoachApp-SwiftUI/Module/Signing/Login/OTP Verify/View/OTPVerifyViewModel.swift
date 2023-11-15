//
//  OTPVerifyViewModel.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma(Work) on 08/05/23.
//

import SwiftUI

class OTPVerifyViewModel : ObservableObject {
    
    @Published var isFocused = false
    @Published var otpField = "" {
        didSet {
            guard otpField.count <= 4,
                  otpField.last?.isNumber ?? true else {
                otpField = oldValue
                return
            }
        }
    }
    
     func otpText(text: String) -> some View {
        
        return Text(text)
            .font(.custom("Poppins-SemiBold", size: 26))
            .foregroundColor(.white)
            .frame(width: 46, height: 60)
            .background(Color.init(red: 78/255, green: 78/255, blue: 78/255,opacity: 0.3))
            .cornerRadius(5)
    }
    
    var otp1: String {
        guard otpField.count >= 1 else {
            return ""
        }
        return String(Array(otpField)[0])
    }
    var otp2: String {
        guard otpField.count >= 2 else {
            return ""
        }
        return String(Array(otpField)[1])
    }
    var otp3: String {
        guard otpField.count >= 3 else {
            return ""
        }
        return String(Array(otpField)[2])
    }
    var otp4: String {
        guard otpField.count >= 4 else {
            return ""
        }
        return String(Array(otpField)[3])
    }
    
    @Published var borderColor: Color = .black
    @Published var isTextFieldDisabled = false
    var successCompletionHandler: (()->())?
    
    @Published var showResendText = true
    
    
    var otpVerificationSuccess : (() -> Void)?
    var otpVerificationFailed : (() -> Void)?

    func verifyOtp(phoneNumber : String, otp : String) {
//        PreLoginEndPoints.validate(phoneNumber: phoneNumber, otp: otp, type: "" , success: {
//            [weak self] (response) in
//            if response.responseCode == 200 && response.message == "Validated OTP" && response.data == nil{
//                self?.otpVerificationSuccess?()
//            }else if response.responseCode == 200 {
//                guard let _ = response.data else {
//                    self?.otpVerificationFailed?()
//                    return
//                }
//                self?.otpVerificationSuccess?()
//            } else {
//                self?.otpVerificationFailed?()
//            }
//        }, failure: {
//            [weak self] (failureRes) in
//            self?.otpVerificationFailed?()
//        })
    }
}
