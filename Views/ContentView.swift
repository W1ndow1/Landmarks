//
//  ContentView.swift
//  Landmarks
//
//  Created by window1 on 2023/07/31.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection, content: {
            CategoryHome()
                .tabItem({
                    Label("Featured", systemImage: "star")
                })
                .tag(Tab.featured)
                
            LandmarkList()
                .tabItem({
                    Label("List", systemImage: "list.bullet")
                })
                .tag(Tab.list)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

