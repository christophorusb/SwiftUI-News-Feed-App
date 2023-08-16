//
//  CategoryDeterminatorLabel.swift
//  CNNBonaFide
//
//  Created by laptop MCO on 13/08/23.
//

import SwiftUI

struct CategoryDeterminatorLabel: View {
    let categoryNum: Int
    var body: some View {
        HStack{
            switch categoryNum {
            case 1:
                Image(systemName: "bolt.horizontal.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("TECHNOLOGY")
            case 2:
                Image(systemName: "skew")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("SCIENCE")
            case 3:
                Image(systemName: "book.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("EDUCATION")
            case 4:
                Image(systemName: "briefcase.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("BUSINESS")
            default:
                Text("DEFAULT")
            }
            Spacer()
        }
        .foregroundColor(Color("CategoryLabel"))
        .font(.callout)
        .bold()
    }
}

struct CategoryDeterminatorLabel_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDeterminatorLabel(categoryNum: 2)
    }
}
