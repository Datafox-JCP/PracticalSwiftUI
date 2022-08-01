    //
    //  ContentView.swift
    //  PracticalSwiftUI
    //
    //  Created by Juan Hernandez Pazos on 29/07/22.
    //

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ContentModel
    
    var index: Int
    var lesson: Lesson {
        if model.currentModule != nil && index < model.currentModule!.content.lessons.count {
            return model.currentModule!.content.lessons[index]
        } else {
            return Lesson(id: 0, title: "", video: "", duration: "", explanation: "")
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                // Confirm that currentModule is set
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count, id: \.self) { index in
                            // Lesson card
                        NavigationLink {
                            ContentDetailView()
                                .onAppear(perform: {
                                    model.beginLesson(index)
                                })
                        } label: {
                            ContentViewRow(index: index)
                        }
                    }
                }
            }
            .accentColor(.black)
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
