    //
    //  ContentView.swift
    //  PracticalSwiftUI
    //
    //  Created by Juan Hernandez Pazos on 29/07/22.
    //

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                // Confirm that currentModule is set
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count, id: \.self) { index in
                            // Lesson card
                        ContentViewRow(index: index)
                    }
                }
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
