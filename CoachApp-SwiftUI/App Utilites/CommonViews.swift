//
//  CommonViews.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 05/04/23.
//

import SwiftUI

struct ToastMessage: View {
    @Binding var req : Bool
    var text : String = ""

    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Text(text)
                .font(.custom("Poppins-Medium", size: 20))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(Color.init(red: 117/255, green: 77/255, blue: 37/255, opacity: 0.6)))
                .padding(.horizontal, 20)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.req = false
                    }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
//struct ToastMessage_Previews: PreviewProvider {
//    static var previews: some View {
//        ToastMessage(text: "DSFSDFDSDFSDDFSF D")
//    }
//}
struct NavigationBarView: View {
    @Environment(\.dismiss) var dismiss

    var text = "Login"
    
    var body: some View {
        HStack(spacing: 10) {
            Button(action: {
                dismiss()
            }) {
                Image("icBack")
            }
            Text(text.uppercased())
                .font(.custom("Opeln2001 Szeroki Metro", size: 30))
                .foregroundColor(.white)
            Spacer()
        }
        .padding(.top, 22)
    }
}
