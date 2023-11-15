//
//  HomeCoachView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 12/04/23.
//

import SwiftUI

struct CategoryVideoModel : Identifiable {
    let id = UUID()
    var categoryImage : String
    var categoryName : String
}

struct HomeCoachView: View {

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    HomeHeaderView()
                    VStack(spacing: 7) {
                        AthletesCoachCards()
                        AthletesCoachCards(text: "Coaches", image: "basketBallCoach")
                    }
                    .padding(.top, 12)
                    CategorySection()
                    LibrarySection()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 15/255, green: 17/255, blue: 20/255))
            .modifier(BaseCustomModifier())
        }
    }
}

struct HomeCoachView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCoachView()
    }
}

struct HomeHeaderView: View {
    @State var moveProfile : Bool = false
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image("basketBallCoach")
                .resizable()
                .clipShape(Circle())
                .frame(width: 54)
                .overlay(Circle().stroke( Color(red: 81/255, green: 81/255, blue: 81/255), lineWidth: 1))
                .shadow(color: Color.init(red: 207/255, green: 154/255, blue: 42/255, opacity: 0.5), radius: 35,x: 0, y: 0)
                .onTapGesture {
                    moveProfile.toggle()
                }
                .navigationDestination(isPresented: $moveProfile) {
                    MyProfile()
                }
            VStack(alignment: .leading) {
                Text("Hello,")
                    .font(.custom("Poppins-Regular", size: 16))
                Text("Larry Kimmons")
                    .font(.custom("Poppins-SemiBold", size: 20))
            }
            .foregroundColor(.white)
            Spacer()
            Image("iconlyLightNotification")
                .background(
                    Circle()
                        .frame(width: 36, height: 36)
                        .foregroundColor(Color(red: 78/255, green: 78/255, blue: 78/255, opacity: 0.3)))
        }
        .frame(height: 54)
        .padding(.horizontal, 15)
        .padding(.top, 30)
    }
}

struct AthletesCoachCards: View {
    var text : String = "Athletes"
    var image : String = "atheleteImg21"
    var body: some View {
        ZStack(alignment: .trailing) {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("My \(text)".uppercased())
                        .font(.custom("Opeln2001 Szeroki Metro", size: 24))
                        .foregroundColor(.white)
                    HStack {
                        Text("10/20")
                            .font(.custom("Poppins-SemiBold", size: 13))
                            .foregroundColor(Color(red: 208/255, green: 155/255, blue: 41/255))
                            .padding(.horizontal,14)
                            .padding(.vertical, 4)
                            .background {
                                RoundedRectangle(cornerRadius: 30)
                            }
                        Text("\(text) Added")
                            .font(.custom("Poppins-Medium", size: 13))
                            .foregroundColor(Color(red: 141/255, green: 141/255, blue: 141/255))
                    }
                }
                Spacer()
            }
            .padding(.leading, 15)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(red: 24/255, green: 24/255, blue: 29/255))
                .overlay() {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 40/255, green: 42/255, blue: 53/255), lineWidth: 1)
                })
            .padding([.horizontal,.top],8)
            Image(image)
        }
        .frame(height: 118)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 7)
    }
}

struct HomeSectionView: View {
    var text : String = "Workout Videos by Category"
    var body: some View {
        HStack {
            Text(text.uppercased())
                .font(.custom("Opeln2001 Szeroki Metro", size: 20))
                .foregroundColor(.white)
            Spacer()
            HStack {
                Text("View all")
                    .font(.custom("Poppins-SemiBold", size: 15))
                    .foregroundColor(Color.init(red: 208/255, green: 155/255, blue: 21/255))
                Image("iconlyLightArrowRight3")
            }
        }
        .padding(.top, 22)
        .padding(.horizontal, 15)
    }
}

struct CategoryCards: View {
    var text : String = "Defense"
    var image : String = "images"
    var body: some View {
        VStack(spacing: 8) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 70)
                .cornerRadius(10)
                .padding(6)
            Text(text.uppercased())
                .font(.custom("Opeln2001 Szeroki Metro", size: 16))
                .foregroundColor(.white)
                .padding(.bottom, 8)
        }
        .background(Color(red: 24/255, green: 24/255, blue: 29/255))
        .overlay() {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 40/255, green: 42/255, blue: 53/255), lineWidth: 1)
        }
        .cornerRadius(10)
    }
}

struct CategorySection: View {
    var categoryVideo : [CategoryVideoModel] = [CategoryVideoModel(categoryImage: "images", categoryName: "Defence"),CategoryVideoModel(categoryImage: "images-2", categoryName: "Attack"),CategoryVideoModel(categoryImage: "images-3", categoryName: "Shooting"),CategoryVideoModel(categoryImage: "images-4", categoryName: "Passing"),CategoryVideoModel(categoryImage: "images-5", categoryName: "Dribbling")]
    
    var body: some View {
        VStack(spacing: 0) {
            HomeSectionView()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(categoryVideo.indices, id: \.self) { item in
                        CategoryCards(text: categoryVideo[item].categoryName, image: categoryVideo[item].categoryImage)
                    }
                }
                .padding(.horizontal, 15)
            }
            .padding(.top, 16)
        }
    }
}

struct LibrarySection: View {
    var categoryVideo : [CategoryVideoModel] = [CategoryVideoModel(categoryImage: "images", categoryName: "Defence"),CategoryVideoModel(categoryImage: "images-2", categoryName: "Attack"),CategoryVideoModel(categoryImage: "images-3", categoryName: "Shooting"),CategoryVideoModel(categoryImage: "images-4", categoryName: "Passing"),CategoryVideoModel(categoryImage: "images-5", categoryName: "Dribbling")]
    @State var moveDetail: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HomeSectionView(text: "Workout Video Library")
            LazyVStack(spacing: 15) {
                ForEach(0..<3, id: \.self) { item in
                    LibraryCard(image: categoryVideo[item].categoryImage)
                        .navigationDestination(isPresented: $moveDetail) {
                            LibraryDetailView()
                        }
                        .onTapGesture {
                            moveDetail.toggle()
                        }
                }
            }
            .padding(.top, 12)
        }
    }
}

struct LibraryCard: View {
    var image : String = "images-2"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Spacer()
            Text("Defence".uppercased())
                .font(.custom("Poppins-SemiBold", size: 11))
                .padding(.horizontal, 8)
                .background(Color(red: 208/255, green: 155/255, blue: 41/255))
                .foregroundColor(.white)
                .cornerRadius(2)
            
            Text("Muscle Shredder")
                .font(.custom("Poppins-SemiBold", size: 19))
                .foregroundColor(.white)
            HStack(spacing: 10) {
                Text("Intermediate")
                    .font(.custom("Poppins-Medium", size: 12))
                    .foregroundColor(Color(red: 180/255, green: 180/255, blue: 180/255))
                HStack(alignment: .center, spacing: 5) {
                    Image(systemName: "clock")
                        .frame(width: 15, height: 15)
                    Text("30 Mins")
                        .font(.custom("Poppins-Medium", size: 12))
                }
                .foregroundColor(Color(red: 180/255, green: 180/255, blue: 180/255))
                HStack(alignment: .center, spacing: 5) {
                    Image(systemName: "calendar")
                        .frame(width: 15, height: 15)
                    Text("Added 2 Days Ago")
                        .font(.custom("Poppins-Medium", size: 12))
                }
                .foregroundColor(Color(red: 180/255, green: 180/255, blue: 180/255))
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
        .background(
            ZStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                LinearGradient(gradient: Gradient(colors: [.clear, Color(red: 0, green: 0, blue: 0)]), startPoint: .top, endPoint: .bottom)
            })
        .frame(height: 200)
        .cornerRadius(10)
        .padding(.horizontal, 15)
    }
}
