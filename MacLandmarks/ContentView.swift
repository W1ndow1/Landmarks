//
//  ContentView.swift
//  MacLandmarks
//
//  Created by window1 on 2023/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LandmarkList()
                .frame(minWidth: 700, minHeight: 300)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
