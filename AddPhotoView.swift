//
//  ContactPhotoView.swift
//  Contacts
//
//  Created by Tom Phillips on 3/4/22.
//

import SwiftUI

struct AddPhotoView: View {
    @Binding var image: UIImage?
    @State private var isShowingImagePicker = false
    var profileImage: Image
    {
        if let image = image {
            return Image(uiImage: image)
        } else {
            return Image(systemName: "person.badge.plus")
            
        }
    }
    
    var body: some View {
        Button(action: {
            isShowingImagePicker = true
        }, label: {
            ContactPhotoView(image: image)
        })
            .buttonStyle(.plain)
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(image: $image)
            }
    }
}

struct ContactPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        AddPhotoView(image: .constant(nil))
    }
}
