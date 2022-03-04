//
//  ContactPhotoView.swift
//  Contacts
//
//  Created by Tom Phillips on 3/4/22.
//

import SwiftUI

struct ContactPhotoView: View {
    var image: UIImage?
    var placeHolderSymbol = "person"
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                
            } else {
                Image(systemName: placeHolderSymbol)
                    .resizable()
                    .padding()
                
            }
        }
        .frame(width: 100, height: 100)
        .scaledToFill()
        .clipShape(Circle())
        .shadow(radius: 10)
        .overlay(Circle().stroke(Color.secondary, lineWidth: 5))
        .padding()
    }
}
