//
//  LibraryDetailView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 14/04/23.
//

import SwiftUI

struct LibraryDetailModel : Identifiable {
    let id = UUID()
    var time : String
    var type : String
    var image : String
}

struct LibraryDetailView: View {
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading,spacing: 0) {
                LibraryImageView()
                DetailText()
                AssignedByView()
                WorkoutDetailGrid()
                WorkoutVideosView()
                Text("Workout Ends On: 22nd July 2021")
                    .font(.custom("Poppins-SemiBold", size: 14))
                    .foregroundColor(Color(red: 198/255, green: 176/255, blue: 134/255))
                    .frame(maxWidth: .infinity)
                    .frame(height: 62)
                    .background(Color(red: 36/255, green: 39/255, blue: 44/255))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 15/255, green: 17/255, blue: 20/255))
        .ignoresSafeArea()
        .modifier(BaseCustomModifier())
    }
}

struct LibraryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryDetailView()
    }
}

struct LibraryImageView: View {
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                Text("Intermediate".uppercased())
                    .font(.custom("Poppins-SemiBold", size: 11))
                    .padding(.horizontal, 8)
                    .background(Color(red: 208/255, green: 155/255, blue: 41/255))
                    .foregroundColor(.white)
                    .cornerRadius(2)
                Text("Fit life Starter")
                    .font(.custom("Poppins-SemiBold", size: 19))
                    .foregroundColor(.white)
                HStack(spacing: 10) {
                    HStack(alignment: .center, spacing: 5) {
                        Image(systemName: "calendar")
                            .frame(width: 15, height: 15)
                        Text("Assigned on : 22nd June 2021")
                            .font(.custom("Poppins-Medium", size: 12))
                    }
                    .foregroundColor(Color(red: 180/255, green: 180/255, blue: 180/255))
                }
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
            .background(
                ZStack {
                    Image("images-2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 325)
                        .clipped()
                    LinearGradient(gradient: Gradient(colors: [.clear, Color(red: 0, green: 0, blue: 0)]), startPoint: .top, endPoint: .bottom)
                })
            .frame(height: 325)
            NavigationBarView(text: "")
                .padding(.horizontal, 20)
                .padding(.top, 20)
        }
    }
}

struct DetailText: View {
    var body: some View {
        Text("This is an advanced level  workout, which can burn the utmost 200kcl of calories and one can perform this workout only with a resistance band, doing it for breathlessly 30 mins takes a lot of fat from coreand arms.")
            .font(.custom("Poppins-Regular", fixedSize: 13))
            .foregroundColor(Color(red: 180/255, green: 180/255, blue: 180/255))
            .padding(.horizontal, 20)
            .padding(.top, 10)
    }
}

struct AssignedByView: View {
    var body: some View {
        Text("Assigned by".uppercased())
            .font(.custom("Opeln2001 Szeroki Metro", size: 20))
            .foregroundColor(.white)
            .padding(.top, 10)
            .padding(.horizontal, 20)
        HStack(alignment: .center, spacing: 15) {
            Image("images-2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 52, height: 52)
                .overlay(Circle().stroke( Color(red: 207/255, green: 153/255, blue: 41/255), lineWidth: 1))
            VStack(alignment: .leading, spacing: 2) {
                Text("Mr. Goldie J. Barnett")
                    .font(.custom("Poppins-SemiBold", size: 18))
                HStack(alignment: .center, spacing: 5) {
                    Image(systemName: "clock")
                        .frame(width: 15, height: 15)
                    Text("30 Mins")
                        .font(.custom("Poppins-Medium", size: 12))
                }
                .foregroundColor(Color(red: 180/255, green: 180/255, blue: 180/255))
            }
            .foregroundColor(.white)
        }
        .padding(.horizontal, 10)
        .frame(height: 77)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 24/255, green: 24/255, blue: 29/255))
        .cornerRadius(10)
        .overlay() {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 40/255, green: 42/255, blue: 53/255), lineWidth: 1)
        }
        .padding(.horizontal, 15)
        .padding(.top, 10)
    }
}

struct WorkoutDetailGrid: View {
    var libraryDetailModel : [LibraryDetailModel] = [LibraryDetailModel(time: "20 Minutes", type: "Duration", image: "clock"),LibraryDetailModel(time: "Weekly", type: "Repeat", image: "clock"),LibraryDetailModel(time: "250 kcl", type: "Calories Burn", image: "clock"),LibraryDetailModel(time: "Upper Body", type: "Focus Body Part", image: "clock")]

    var layout : [GridItem] = [GridItem(.flexible(), spacing: 15), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: layout, alignment: .leading, spacing: 15) {
            ForEach(libraryDetailModel.indices, id: \.self) { i in
                HStack(spacing: 10) {
                    Image(systemName: libraryDetailModel[i].image)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.init(red: 208/255, green: 155/255, blue: 21/255))
                    VStack(alignment: .leading, spacing: 2) {
                        Text(libraryDetailModel[i].type)
                            .font(.custom("Poppins-Regular", size: 12))
                            .foregroundColor(Color.init(red: 180/255, green: 180/255, blue: 180/255))
                        Text(libraryDetailModel[i].time)
                            .font(.custom("Poppins-SemiBold", size: 16))
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 58)
                .background(Color.init(red: 36/255, green: 39/255, blue: 44/255))
                .cornerRadius(10)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 15)
    }
}

struct WorkoutVideosList: View {
    var body: some View {
        HStack(spacing: 10) {
            Image("images-5")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(3)
            VStack(alignment: .leading, spacing: 4) {
                Text("Triceps Pushups")
                    .font(.custom("Poppins-Medium", fixedSize: 15))
                    .foregroundColor(Color(red: 180/255, green: 180/255, blue: 180/255))
                Image("group9973")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
    }
}

struct WorkoutVideosView: View {
    var body: some View {
        Text("Exercise Library for this workout".uppercased())
            .font(.custom("Opeln2001 Szeroki Metro", size: 20))
            .foregroundColor(.white)
            .padding(.top, 28)
            .padding(.horizontal, 20)
        LazyVStack(spacing: 15) {
            ForEach(0..<4, id: \.self) { _ in
                WorkoutVideosList()
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}
