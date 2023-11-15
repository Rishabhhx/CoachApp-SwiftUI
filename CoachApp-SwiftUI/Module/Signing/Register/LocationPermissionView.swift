//
//  LocationPermissionView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 07/04/23.
//

import SwiftUI

struct LocationPermissionView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            LocationContentView()
            ManageButtonLocation()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("icMainBg")
            .resizable()
            .ignoresSafeArea())
        .modifier(BaseCustomModifier())
    }
}

struct LocationPermissionView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPermissionView()
    }
}

struct LocationContentView: View {
    var heading : String = "Enable Location"
    var subHeading : String = "This App requires that location services are turned on your device and for this app. You must enable them in settings before using this app"
    var image : String = "icLocation"
    
    var body: some View {
        VStack(spacing: 0) {
            Text(heading.uppercased())
                .foregroundColor(.white)
                .font(.custom("Opeln2001 Szeroki Metro", size: 30))
            Text(subHeading)
                .foregroundColor(.white)
                .font(.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .padding(.top, 15)
                .padding(.horizontal,20)
            ZStack {
                Circle()
                    .fill(Color.init(red: 51/255, green: 51/255, blue: 51/255))
                Image(image)
            }
            .frame(width: 158,height: 158)
            .padding(.top, 30)
        }
    }
}

struct ManageButtonLocation: View {
    @ObservedObject var locationManager = LocationManager.shared
    @State var moveToDob : Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                LocationManager.shared.requestLocation()
            }) {
                YellowButtonView(text: "Allow only Using this App".uppercased())
            }
            .navigationDestination(isPresented: $locationManager.movenext) {
                OnboardingScreen()
            }
            Button(action: {
                moveToDob.toggle()
            }) {
                YellowBorderButtonView(text: "Don’t Allow this App".uppercased())
            }
            .navigationDestination(isPresented: $moveToDob) {
                OnboardingScreen()
            }
        }
        .padding(.horizontal,20)
        .padding(.top,50)
    }
}
