//
//  MyProfile.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma(Work) on 21/04/23.
//

import SwiftUI

struct MyProfile: View {
    @State var moveAccounts: Bool = false
    @State var moveSubs: Bool = false
    @State var movePayment: Bool = false
    @State var moveSettings: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                MyProfileHeader()
                LazyVStack {
                    MyProfileCell(text: "My Account", image: "nounAccount3641054")
                        .onTapGesture {
                            moveAccounts.toggle()
                        }
                        .navigationDestination(isPresented: $moveAccounts) {
                            MyAccountView()
                        }
                    MyProfileCell(text: "Workout History", image: "path89630")
                        .onTapGesture {
                            moveAccounts.toggle()
                        }
                        .navigationDestination(isPresented: $moveAccounts) {
                            MyAccountView()
                        }
                    MyProfileCell(text: "My Subscription", image: "nounSubscription2070192")
                        .onTapGesture {
                            moveSubs.toggle()
                        }
                        .navigationDestination(isPresented: $moveSubs) {
                            MySubscriptionView()
                        }
                    MyProfileCell(text: "My Payments", image: "nounPayment4060342")
                        .onTapGesture {
                            movePayment.toggle()
                        }
                        .navigationDestination(isPresented: $movePayment) {
                            MyPaymentView()
                        }
                    MyProfileCell(text: "Settings", image: "nounSettings4053119")
                        .onTapGesture {
                            moveSettings.toggle()
                        }
                        .navigationDestination(isPresented: $moveSettings) {
                            SettingsView()
                        }
                }
                .padding(.vertical, 60)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background() {
            LottieView(loopMode: .loop)
                .ignoresSafeArea()
        }
        .modifier(BaseCustomModifier())
    }
}

struct MyProfile_Previews: PreviewProvider {
    static var previews: some View {
        MyProfile()
    }
}

struct MyProfileHeader : View {
    var body: some View {
        NavigationBarView(text: "")
            .padding(.top, 17)
            .padding(.leading,20)
            .padding(.trailing, 16)
        ZStack {
            Image("images-3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay() {
                    Circle()
                        .stroke(Color(red: 59/255, green: 59/255, blue: 59/255), lineWidth: 1)
                }
                .clipShape(Circle())
                .frame(width: 104, height: 104)
            VStack(alignment: .trailing) {
                Spacer()
                Image("icImgTick")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .frame(maxWidth: .infinity,alignment: .trailing)
        }
        .frame(width: 104, height: 104)
        .padding(.top, -30)
        VStack(spacing: 5) {
            Text("Larry Kimmons")
                .font(.custom("Poppins-SemiBold", size: 20))
                .foregroundColor(.white)
            Text("Intermediate Level")
                .font(.custom("Poppins-SemiBold", size: 14))
                .foregroundColor(Color.init(red: 208/255, green: 155/255, blue: 21/255))
                .padding(.horizontal ,16)
                .background(RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.init(red: 33/255, green: 35/255, blue: 37/255)))
                .overlay() {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 40/255, green: 42/255, blue: 53/255), lineWidth: 1)
                }
        }
    }
}

struct MyProfileCell: View {
    var text : String = "My Account"
    var image : String = "nounAccount3641054"
    var body: some View {
        HStack {
            Image(image)
                .frame(width: 36, height: 36)
                .background(Circle()
                    .foregroundColor(Color(red: 78/255, green: 78/255, blue: 78/255)))
            Text(text)
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(.white)
            Spacer()
            Button(action: {}) {
                Image("group9997")
            }
        }
        .padding(.horizontal, 10)
        .frame(height: 60)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(red: 15/255, green: 17/255, blue: 20/255)))
        .overlay() {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 40/255, green: 42/255, blue: 53/255))
        }
        .padding(.horizontal, 15)
    }
}
