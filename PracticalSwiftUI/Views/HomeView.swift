    //
    //  HomeView.swift
    //  PracticalSwiftUI
    //
    //  Created by Juan Hernandez Pazos on 29/07/22.
    //

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) { module in
                                // Learning Card
                            VStack(spacing: 20) {
                                HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                
                                    // Test Card
                                HomeViewRow(image: module.test.image, title: "\(module.category) Tests", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
