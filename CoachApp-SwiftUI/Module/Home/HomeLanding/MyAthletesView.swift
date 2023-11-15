//
//  MyAthletesView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma(Work) on 08/05/23.
//

import SwiftUI

struct MyAthletesView: View {
    @State var progressValue: Float = 0.35

    var body: some View {
        VStack {
            MyAthletesHeader()
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image("images-3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay() {
                            Circle()
                                .stroke(Color(red: 59/255, green: 59/255, blue: 59/255), lineWidth: 1)
                        }
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text("George Newman")
                            .font(.custom("Poppins-Medium", size: 18))
                            .foregroundColor(.white)
                        Spacer()
                        Text("23 Yrs")
                            .font(.custom("Poppins-Medium", size: 12))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .frame(height: 50)
                .padding(.top, 20)
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text("Assigned Workout :")
                            .font(.custom("Poppins-Regular", size: 12))
                            .foregroundColor(Color(red: 208/255, green: 208/255, blue: 208/255))
                        Text(" 15 Workouts")
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.white)
                    }
                    HStack {
                        Text("Last Assigned :")
                            .font(.custom("Poppins-Regular", size: 12))
                            .foregroundColor(Color(red: 208/255, green: 208/255, blue: 208/255))
                        Text(" 20 Jan 2021")
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 10)
                ProgressBar(progress: self.$progressValue)
                    .frame(width: 44, height: 44)
                    .padding(40.0)
                Spacer()
            }
            .padding(.horizontal, 20)
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(Color(red: 24/255, green: 24/255, blue: 29/255))
            .cornerRadius(10)
            .overlay() {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 40/255, green: 42/255, blue: 53/255), lineWidth: 1)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 15/255, green: 17/255, blue: 20/255))
        .modifier(BaseCustomModifier())
    }
}

struct MyAthletesView_Previews: PreviewProvider {
    static var previews: some View {
        MyAthletesView()
    }
}

struct MyAthletesHeader: View {
    var body: some View {
        HStack {
            NavigationBarView(text: "my athletes")
            Image("group9970")
                .padding(6)
                .background() {
                    Circle()
                        .foregroundColor(Color(red: 34/255, green: 39/255, blue: 44/255))
                }
        }
    }
}

struct ProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2.0)
                .opacity(0.3)
                .foregroundColor(Color(red: 74/255, green: 74/255, blue: 77/255))
            Circle()
                .trim(from: 0.0, to: CGFloat(progress))
                .stroke(style: StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(red: 207/255, green: 154/255, blue: 42/255))
                .rotationEffect(Angle(degrees: 270))
            Circle()
                .frame(width: 33, height: 33)
                .foregroundColor(Color(red: 78/255, green: 78/255, blue: 78/255, opacity: 0.3))
            Text("\(Int(progress*100))%")
                .font(.custom("Poppins-Medium", size: 12))
                .foregroundColor(.white)
        }
    }
}
