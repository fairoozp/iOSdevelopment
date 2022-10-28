//
//  FruitAndBerries.swift
//  SampleApp
//
//  Created by Fairooz P on 18/10/22.
//

import SwiftUI

struct FruitAndBerries: View {
    @State var fruitName: String
    let names = ["Apple", "Mango", "Banana", "Grapes"]
    var body: some View {
        VStack{
            Spacer().frame(height: 10)
            HStack {
                Spacer()
                    .frame(width: 20)
                Text("Fruits and berries")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                Spacer()
            }
            List {
                ForEach(searchResults, id: \.self) { name in
                                    NavigationLink(destination: Text(name)) {
                                        Text(name)
                                        
                                    }
                }
            }.searchable(text: $fruitName) {
                
            }
//            SearchView(fruitName: $fruitName)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    var searchResults: [String] {
            if fruitName.isEmpty {
                return names
            } else {
                return names.filter { $0.contains(fruitName) }
            }
        }
}

struct SearchView: View {
    @Binding var fruitName: String
    var body: some View {
        HStack{
            TextField("Search", text: $fruitName)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                
                .padding(.horizontal, 20)
        }
    }
}

struct FruitAndBerries_Previews: PreviewProvider {
    @State static var fruitName: String = ""
    static var previews: some View {
        FruitAndBerries(fruitName: fruitName)
    }
}
