//
//  ImageView.swift
//  CNNBonaFide
//
//  Created by Christophorus Beneditto Aditya Satrio on 13/08/23.
//

import SwiftUI

struct ImageView: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: "\(url)")) {
            phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            // Error found
            else if phase.error != nil {
                RoundedRectangle(cornerRadius: 10)
            }
            // Other phase ( image loading etc )
            else {
                RoundedRectangle(cornerRadius: 10)
                    .background(Color.gray)
            }
        }
        .scaledToFit()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://akcdn.detik.net.id/visual/2023/08/05/semrawutnya-kabel-utilitas-di-jakarta-5_169.jpeg?w=360&q=100")
    }
}
