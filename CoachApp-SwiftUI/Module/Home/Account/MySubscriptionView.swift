//
//  MySubscriptionView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma(Work) on 03/05/23.
//

import SwiftUI

struct MySubscriptionView: View {
    @State var isOn = true

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            NavigationBarView(text: "My Subscription")
            LazyVStack {
                SubscriptionInfoCell()
                SubscriptionInfoCell(text: "Billing Amount",text2: "$ 123")
                SubscriptionInfoCell(text: "Billing Cycle",text2: "Monthly")
                SubscriptionInfoCell(text: "Next Billing Date",text2: "21 October 2020")
                SubscriptionInfoCell(text: "Billed To",text2: "XXXX XXXX XXXX 5282")
            }
            .padding(.top, 40)
            HStack {
                Text("Auto Renewal")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.white)
                Spacer()
                Toggle("", isOn: $isOn)
            }
            .padding(.top, 24)
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

struct MySubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MySubscriptionView()
    }
}

struct SubscriptionInfoCell: View {
    var text: String = "Last Billed On"
    var text2: String = "21 June 2021"

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(text)
                .font(.custom("Poppins-Medium", size: 12))
                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
            Text(text2)
                .font(.custom("Poppins-SemiBold", size: 16))
                .foregroundColor(.white)
            Divider()
                .background(Color(red: 60/255, green: 60/255, blue: 60/255))
                .padding(.top, 10)
                .padding(.horizontal, -20)
        }
    }
}
