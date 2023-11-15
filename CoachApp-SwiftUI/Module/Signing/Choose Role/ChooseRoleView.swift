//
//  ChooseRoleView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 01/04/23.
//

import SwiftUI

struct ChooseRoleView: View {
    
    @State var role : SelectedRole = .none

    var body: some View {
        ZStack {
            Image("icMainBg")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Choose your Role onthe Application".uppercased())
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .font(.custom("Opeln2001 Szeroki Metro", size: 30))
                    .foregroundColor(.white)
                Spacer()
                ContinueAsView(role: $role)
                Spacer()
                BottomButton(role: $role)
                Spacer()
            }
            .padding(.horizontal, 20)
            .multilineTextAlignment(.center)
        }
        .modifier(BaseCustomModifier())
    }
}

struct ChooseRoleView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseRoleView()
    }
}

enum SelectedRole {
    case athlete
    case coach
    case none
}

struct ContinueAsView: View {
    
    @Binding var role : SelectedRole
    
    var body: some View {
        VStack {
            Text("I want to Continue as a")
                .font(.custom("Poppins-Medium", size: 18))
                .foregroundColor(.white)
                .padding(.horizontal,40)
            VStack(spacing: 36) {
                RoleSelectView(role: $role, currentRole: .athlete)
                RoleSelectView(role: $role, text: "Coach", image: "icAtheleteSelect", currentRole: .coach)
            }
        }
    }
}

struct GreyButtonView: View {
    var text : String = "PROCEED"
    var body: some View {
        Text(text)
            .font(.custom("Opeln2001 Szeroki Metro", size: 20))
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.init(red: 78/255, green: 78/255, blue: 78/255))
            .cornerRadius(30)
    }
}

struct YellowButtonView: View {
    var text : String = "PROCEED"
    var body: some View {
        VStack {
            Text(text)
                .font(.custom("Opeln2001 Szeroki Metro", size: 20))
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 207/255, green: 154/255, blue: 42/255), Color.init(red: 117/255, green: 77/255, blue: 37/255)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(30)
        }
        .shadow(color: Color.init(red: 117/255, green: 77/255, blue: 37/255, opacity: 0.5), radius: 20,x: 0, y: 5)
    }
}

struct YellowBorderButtonView: View {
    var text : String = "PROCEED"
    var body: some View {
        VStack {
            Text(text.uppercased())
                .font(.custom("Opeln2001 Szeroki Metro", size: 20))
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.init(red: 208/255, green: 155/255, blue: 41/255))
                .background(Color.init(red: 36/255, green: 34/255, blue: 36/255))
                .overlay() {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.init(red: 208/255, green: 155/255, blue: 41/255), lineWidth: 2)
                }
                .cornerRadius(30)
        }
    }
}

struct BottomButton: View {
    
    @State var pushToLogin : Bool = false
    @Binding var role: SelectedRole
    
    var body: some View {
        if role == .none {
            Button { } label: {
                GreyButtonView(text: "PROCEED")
            }
            
            .disabled(true)
        } else {
            Button {
                pushToLogin.toggle()
            } label: {
                YellowButtonView(text: "PROCEED")
            }
            .navigationDestination(isPresented: $pushToLogin) {
                LoginNowView()
            }
        }
    }
}

struct RoleSelectView: View {
    
    @Binding var role : SelectedRole
    var text: String = "Athlete"
    var image : String = "icAtheleteDeselect"
    var currentRole : SelectedRole = .athlete
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor( role == currentRole ? Color.init(red: 195/255, green: 130/255, blue: 25/255) : Color.init(red: 51/255, green: 51/255, blue: 51/255))
                    .shadow(color: role != currentRole ? .clear : Color.init(red: 117/255, green: 77/255, blue: 37/255, opacity: 0.5), radius: 20,x: 0, y: 5)
                Image(image)
                if role == currentRole {
                    HStack {
                        Spacer()
                        Image("icImgTick")
                    }
                    .padding(.top,10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
                }
            }
            .frame(width: 158, height: 158)
            Text(text.uppercased())
                .font(.custom("Opeln2001 Szeroki Metro", size: 20))
                .foregroundColor(Color.init(red: 198/255, green: 176/255, blue: 134/255))
        }
        .onTapGesture {
            role = currentRole
        }
    }
}
