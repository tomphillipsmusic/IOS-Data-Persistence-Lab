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
    
    var body: some View {
        Button(action: {
            isShowingImagePicker = true
        }, label: {
            ZStack {
                ContactPhotoView(image: image)
                plusSymbol
            }
        })
            .buttonStyle(.plain)
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(image: $image)
            }
        
    }
    
    var plusSymbol: some View {
        Image(systemName: "plus")
            .foregroundColor(.white)
            .frame(width: 25, height: 25)
            .background(Color.blue)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
    }
}

struct ContactPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        AddPhotoView(image: .constant(nil))
    }
}
