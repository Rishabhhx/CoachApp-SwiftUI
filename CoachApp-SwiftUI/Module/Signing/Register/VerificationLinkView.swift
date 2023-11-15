//
//  VerificationLinkView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 06/04/23.
//

import SwiftUI

struct VerificationLinkView: View {
    @Environment(\.dismiss) var dismiss
    let nextButtonPressed : () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image("verificationLink")
                Spacer()
            }
            .padding(.top, 36)
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("Verification Link Sent".uppercased())
                .foregroundColor(.white)
                .font(.custom("Opeln2001 Szeroki Metro", size: 30))
                .padding(.top, -10)
            Text("We’ve sent a verification link on your email id, please verify your email in order to activate your account")
                .foregroundColor(.white)
                .font(.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .padding(.top, 15)
                .padding(.horizontal,20)
            Spacer()
            Button(action: {
                dismiss()
                nextButtonPressed()
            }) {
                YellowButtonView(text: "NEXT")
                    .padding(.horizontal, 20)
            }
            
            .padding(.bottom, 46)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(RoundedCornersShape(corners: [.topLeft, .topRight], radius: 20)
            .foregroundColor(Color.init(red: 40/255, green: 43/255, blue: 48/255)))
        .ignoresSafeArea(edges: .bottom)
    }
}

struct VerificationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationLinkView(nextButtonPressed: {})
    }
}
struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            
            superview?.superview?.backgroundColor = .clear
        }
        
    }
}
