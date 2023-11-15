//
//  Extensions.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 03/04/23.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboardWhenTappedAround() -> some View  {
        return self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                  to: nil, from: nil, for: nil)
        }
    }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

extension String {
    
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}").evaluate(with: self)
    }
    
    var numberValidation: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9]).{10}$").evaluate(with: self)
    }
}
