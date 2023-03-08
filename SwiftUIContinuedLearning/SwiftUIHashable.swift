//
//  SwiftUIHashable.swift
//  SwiftUIContinuedLearning
//
//  Created by Baris Ciftci on 06/03/2023.
//

import SwiftUI

struct MyCustomModel: Hashable {
    
    let title: String

}

struct SwiftUIHashable: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR"),
        MyCustomModel(title: "FIVE"),
    
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
            }
        }
    }
}

struct SwiftUIHashable_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIHashable()
    }
}
