//
//  MyPaymentView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma(Work) on 08/05/23.
//

import SwiftUI

struct MyPaymentView: View {
    var body: some View {
        VStack {
            NavigationBarView(text: "My payments")
            LazyVStack(spacing: 15) {
                ForEach(0..<3) { _ in
                    SubscriptionCellView()
                }
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("icMainBg")
            .resizable()
            .ignoresSafeArea())
        .modifier(BaseCustomModifier())
    }
}

struct MyPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        MyPaymentView()
    }
}

struct SubscriptionCellView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Monthly Subscription")
                    .font(.custom("Poppins-SemiBold", size: 16))
                    .foregroundColor(.white)
                Spacer()
                Text("SUCESS")
                    .font(.custom("Poppins-SemiBold", size: 11))
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 4)
                    .background(RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(red: 29/255, green: 142/255, blue: 11/255)))
            }
            Spacer()
            HStack(spacing: 0) {
                Text("Amount Paid:")
                Text(" $250")
                    .font(.custom("Poppins-SemiBold", size: 12))
                    .foregroundColor(Color(red: 208/255, green: 155/255, blue: 41/255))
                Spacer()
                Text("06:44 PM")
            }
            .font(.custom("Poppins-Medium", size: 12))
            .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
            HStack(spacing: 0) {
                Text("Trans ID: # 12234456677788")
                Spacer()
                Text("21/June/2021")
            }
            .font(.custom("Poppins-Medium", size: 12))
            .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .frame(height: 92)
        .frame(maxWidth: .infinity)
        .background(Color(red: 36/255, green: 39/255, blue: 44/255))
        .cornerRadius(10)
    }
}
