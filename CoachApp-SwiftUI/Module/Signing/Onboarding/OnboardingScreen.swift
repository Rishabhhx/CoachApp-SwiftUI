//
//  ContentView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 31/03/23.
//

import SwiftUI
import CoreData

struct OnboardingScreen: View {
    @State var pageControl : [String] = ["kpage_control_selected","kpage_control_unselected","kpage_control_unselected"]
#if os(iOS)
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                BackgroundView(pageControl: $pageControl)
                    .frame(height: UIScreen.main.bounds.height/1.6)
                Spacer()
                TextInfoView(pageControl: $pageControl)
                Spacer()
                ButtonsView()
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(SwiftUI.Color.init(red: 27/255, green: 31/255, blue: 35/255))
        .modifier(BaseCustomModifier())
        }
    }
    #else
    var body: some View {
        TextInfoView(pageControl: $pageControl)
    }
    #endif
}

struct BackgroundView: View {
    @State var pageIndex = 0
    @Binding var pageControl: [String]

    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    var backgroundImages : [String] = ["icTutorialImg1","icTutorialImg1","icTutorialImg1"]
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(backgroundImages.indices, id: \.self) { image in
                Image(backgroundImages[image])
                    .resizable()
                    .ignoresSafeArea()
            }
        }
        .disabled(true)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onReceive(timer, perform: { _ in
            withAnimation {
                pageIndex = pageIndex < backgroundImages.count - 1 ? pageIndex + 1 : 0
            }
                pageControl = ["kpage_control_unselected","kpage_control_unselected","kpage_control_unselected"]
                pageControl[pageIndex] = "kpage_control_selected"
//            }
        })
    }
}
struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct TextInfoView: View {
    @Binding var pageControl: [String]

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("Lorem Ipsum is simply".uppercased())
                .font(.custom("Opeln2001 Szeroki Metro", size: 40))
                .foregroundColor(.white)
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.".uppercased())
                .multilineTextAlignment(.center)
                .font(.custom("Poppins-Medium", size: 14))
                .foregroundColor(Color.init(red: 198/255, green: 176/255, blue: 134/255))
                .frame(alignment: .center)
            HStack {
                ForEach(pageControl, id: \.self) {image in
                    Image(image)
                }
            }
            .padding(.top,22)
        }
        .padding(.horizontal, 20)
    }
}

struct ButtonsView: View {
    
    @State var pushToRole: Bool = false
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Text("Skip".uppercased())
                    .font(.custom("Opeln2001 Szeroki Metro", size: 18))
                    .foregroundColor(.white)
            }
            Spacer()
                Button(action: {
                    pushToRole.toggle()
                }) {
                    Text("Get Started".uppercased())
                        .font(.custom("Opeln2001 Szeroki Metro", size: 20))
                        .foregroundColor(.white)
                        .padding(.vertical,14)
                        .padding(.horizontal,29)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 207/255, green: 154/255, blue: 42/255), Color.init(red: 117/255, green: 77/255, blue: 37/255)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(30)
                }
            .navigationDestination(isPresented: $pushToRole) {
                ChooseRoleView()
            }
        }
        .padding(.horizontal, 14)
        .padding(.bottom, 36)
    }
}
