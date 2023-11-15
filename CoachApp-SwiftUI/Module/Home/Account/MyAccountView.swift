//
//  MyAccountView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma(Work) on 28/04/23.
//

import SwiftUI

struct MyAccountView: View {
    @State var nameText : String = "Larry Kimmons"
    @State var emailText : String = "larrykimmons@gmail.com"
    @State var phoneText : String = "9874563210"
    @State var agreeSelected : Bool = false
    @State var presentVerification : Bool = false
    @State var pushToOtp : Bool = false
    @State var dobText = Date()
    @State var isEdit : Bool = false
    
    let dateFormatter = DateFormatter()
    @State var passwordText : String = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing:0) {
                    HStack(alignment: .bottom) {
                        NavigationBarView(text: "My Account")
                        Button(action: {
                            isEdit.toggle()
                        }) {
                            if isEdit {
                                Text("SAVE")
                                    .font(.custom("Poppins-SemiBold", size: 20))
                                    .foregroundColor(Color.init(red: 208/255, green: 155/255, blue: 21/255))
                            } else {
                                Image("iconlyLightEdit")
                                    .frame(width: 36, height: 36)
                                    .background() {
                                        Circle()
                                            .foregroundColor(Color(red: 33/255, green: 35/255, blue: 37/255))
                                    }
                            }
                        }
                    }
                        .padding(.horizontal, 20)
                    Image("images-3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay() {
                            Circle()
                                .stroke(Color(red: 59/255, green: 59/255, blue: 59/255), lineWidth: 1)
                        }
                        .clipShape(Circle())
                        .frame(width: 104, height: 104)
                        .padding(.top, 20)
                    MyAccountTextFieldSetup(nameText: $nameText, emailText: $emailText, phoneText: $phoneText, passwordText: $passwordText, dobText: $dobText, isEdit: $isEdit)
                        .padding(.horizontal,20)
                    MyProfileCell(text: "Change Password", image: "nounPassword4051185")
                        .padding(.top,15)
                }
                .onChange(of: dobText, perform: { newValue in
                    passwordText = DateFormatter.localizedString(from: dobText, dateStyle: .long, timeStyle: .none)
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("icMainBg")
                .resizable()
                .ignoresSafeArea())
            .animation(.linear, value: [nameText,emailText,phoneText,passwordText])
            .modifier(BaseCustomModifier())
            .animation(.easeIn, value: presentVerification)
        }
    }
    func getDateComponents(date: Date) -> (day: Int, month: String, year: Int) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        let monthName = DateFormatter().monthSymbols[components.month! - 1]
        return (day: components.day ?? 0, month: monthName, year: components.year ?? 0)
    }
}

struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountView()
    }
}

struct MyAccountTextFieldSetup: View {
    @Binding var nameText : String
    @Binding var emailText : String
    @Binding var phoneText : String
    @Binding var passwordText : String
    @Binding var dobText : Date
    @Binding var isEdit: Bool
    
    var body: some View {
        VStack(spacing:15) {
            TextfieldLoginView(text: $nameText,showEye: false,placeHolderText: "Full Name")
            TextfieldLoginView(text: $emailText,showEye: false,placeHolderText: "Email Address")
            TextfieldLoginView(text: $phoneText,showEye: false,placeHolderText: "Phone Number")
                .keyboardType(.numberPad)
            AccountTextfeildView(text: $passwordText,dobText: $dobText, isEdit: $isEdit, showEye: false,placeHolderText: "Date of birth")
        }
        .foregroundColor(isEdit ? .white : Color.init(red: 153/255, green: 153/255, blue: 153/255))
        .disabled(!isEdit)
        .padding(.top,30)
    }
}

struct AccountTextfeildView: View {
    @Binding var text: String
    @State var showText : Bool = false
    @Binding var dobText : Date
    @Binding var isEdit: Bool
    
    var showEye: Bool = true
    
    var placeHolderText : String = "Login by Email or Mobile No"
    var body: some View {
        VStack(spacing: 6) {
            if !text.isEmpty {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 18)
            }
            
            ZStack(alignment: .leading) {
                Text(placeHolderText).foregroundColor(Color.init(red: 153/255, green: 153/255, blue: 153/255))
                    .padding(.leading,text.isEmpty ? 20 : 0)
                    .offset(y: text.isEmpty ? 0 : -40)
                    .font(Font.custom("Poppins-Medium", size: text.isEmpty ? 13 : 12))
                ZStack {
                    ZStack {
                        Text(text)
//                            .foregroundColor(isEdit ? .white : Color.init(red: 153/255, green: 153/255, blue: 153/255))
                            .font(.custom("Poppins-Medium", size: 13))
                        DatePicker("", selection: $dobText,in: ...Date() ,displayedComponents: .date)
                            .labelsHidden()
                            .applyTextColor(.clear)
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.init(red: 78/255, green: 78/255, blue: 78/255, opacity: 0.3)))
                }
            }
        }
    }
}
