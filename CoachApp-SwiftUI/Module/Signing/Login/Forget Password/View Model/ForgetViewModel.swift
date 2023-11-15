//
//  ForgetViewModel.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma(Work) on 08/05/23.
//

import Foundation
class ForgetViewModel: ObservableObject {
    var sendSmsClosure : (() -> Void)?
    var sendSmsFailed : (() -> Void)?

    func sendSms(phoneNumber : String) {
//        PreLoginEndPoints.sendSms(phoneNumber: phoneNumber, success: {
//            [weak self] (response) in
//            if response.responseCode == 200 {
//                self?.sendSmsClosure?()
//            } else {
//                self?.sendSmsFailed?()
//            }
//        }, failure: {
//            [weak self] (failureRes) in
//            self?.sendSmsFailed?()
//        })
    }
}

