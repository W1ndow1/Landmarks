//
//  ProfileEdior.swift
//  Landmarks
//
//  Created by window1 on 2023/08/23.
//

import SwiftUI

struct ProfileEdior: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    var body: some View {
        List {
            HStack {
                Text("UserName")
                    .bold()
                Divider()
                TextField(text: $profile.username, label: {
                    Text("UserName")
                })
            }
            Toggle(isOn: $profile.prefersNotifications, label: {
                Text("Enable Notification")
                    .bold()
            })
            
            VStack(alignment: .leading, spacing: 20) {
                Picker("Seasonal Photo", selection: $profile.seasonlPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date, label: {
                Text("Goal Date").bold()
            })
        }
    }
}

struct ProfileEdior_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEdior(profile: .constant(.default))
    }
}
