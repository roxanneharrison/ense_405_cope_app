//
//  CBTView.swift
//  cope_app WatchKit Extension
//
//  Created by Roxanne Harrison on 2021-10-23.
//

import SwiftUI

struct tutorial: View {
    // Fetch request to get folders
    @FetchRequest(
        entity: CBTList.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \CBTList.dateAdded, ascending: false)],
        animation: .easeInOut)
    
    var results: FetchedResults<CBTList>
    
    var body: some View {
        List{
            ForEach(results){item in
                HStack{
                    NavigationLink(
                        destination: Text (item.cue ?? ""),
                        label: {
                            Text(item.cue ?? "")
                        })
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .contentShape(Rectangle())
                        .background(
                            LinearGradient(gradient:
                                            Gradient(colors: [Color(item.color ?? "blue"),
                                                              Color(item.color ?? "blue").opacity(0.8),
                                                              Color(item.color ?? "blue"),]),
                                           startPoint: UnitPoint.top,
                                           endPoint: UnitPoint.bottom))
                        .cornerRadius(5)
                }
            }
            NavigationLink(
                destination: Text("Add new"),
                label: {
                    HStack{
                        Spacer()
                        Image(systemName: "plus")
                        Text("New Folder")
                        Spacer()
                    }
                }).listStyle(CarouselListStyle())
                .navigationTitle("Folders")
        }
    }
}

struct CBTView_Previews: PreviewProvider {
    static var previews: some View {
        CBTView()
    }
}
