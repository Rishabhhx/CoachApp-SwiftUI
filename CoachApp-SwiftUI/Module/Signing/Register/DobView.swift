//
//  DobView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 07/04/23.
//

import SwiftUI

struct DobView: View {
    
    @State var dobText = Date()
    @State var day = "Day"
    @State var month = "Month"
    @State var year = "Year"
    
    var body: some View {
        VStack(spacing: 30) {
            LocationContentView(heading: "Add your DOB".uppercased(), subHeading: "Select your Date of birth So that we can calculate your exact age.",image: "icCalendar")
            ManageDobView(dobText: $dobText, day: $day, month: $month, year: $year)
            YellowButtonView(text: "Submit".uppercased())
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("icMainBg")
            .resizable()
            .ignoresSafeArea())
        .modifier(BaseCustomModifier())
    }
}

struct DobView_Previews: PreviewProvider {
    static var previews: some View {
        DobView()
    }
}

extension View {
  @ViewBuilder func applyTextColor(_ color: Color) -> some View {
    if UITraitCollection.current.userInterfaceStyle == .light {
      self.colorInvert().colorMultiply(color)
    } else {
      self.colorMultiply(color)
    }
  }
}

struct ManageDobView: View {
    
    @Binding var dobText : Date
    @Binding var day : String
    @Binding var month: String
    @Binding var year: String
    
    var body: some View {
        HStack {
            DateView(text: $day, dobText: $dobText, width: 70)
            Spacer()
            DateView(text: $month, dobText: $dobText, width: 134)
            Spacer()
            DateView(text: $year, dobText: $dobText, width: 110)
        }
        .onChange(of: dobText, perform: { newValue in
            day = "\(getDateComponents(date: dobText).day)"
            month = getDateComponents(date: dobText).month
            year = "\(getDateComponents(date: dobText).year)"
        })
    }
    
    func getDateComponents(date: Date) -> (day: Int, month: String, year: Int) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        let monthName = DateFormatter().monthSymbols[components.month! - 1]
        return (day: components.day ?? 0, month: monthName, year: components.year ?? 0)
    }
}

struct DateView: View {
    @Binding var text : String
    @Binding var dobText : Date
    var width : CGFloat = .infinity
    var body: some View {
        ZStack {
            Text(text)
                .foregroundColor(Color.init(red: 153/255, green: 153/255, blue: 153/255))
                .font(.custom("Poppins-Medium", size: 13))
            DatePicker("", selection: $dobText,in: ...Date() ,displayedComponents: .date)
                .labelsHidden()
                .applyTextColor(.clear)
        }
        .frame(width: width ,height: 50)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.init(red: 78/255, green: 78/255, blue: 78/255, opacity: 0.3)))
    }
}
