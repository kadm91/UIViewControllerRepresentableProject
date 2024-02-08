//
//  ContentView.swift
//  UIViewControllerRepresentableProject
//
//  Created by Kevin Martinez on 2/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showImagaePickerView = false
    @State private var selectedImage: UIImage?
    @State private var image = UIImage()
    
    var body: some View {
        VStack {
            Text("Choose an Image")
                .font(.largeTitle)
                .padding()
            Spacer()
            imageView
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    showImagaePickerView.toggle()
                }
                .padding()
            Spacer()
            Spacer()
        }
        .sheet(isPresented: $showImagaePickerView, content: {            ImagePickerView(selectedImage: $selectedImage)
        })
    }
}

//MARK: - extension

extension ContentView {
    var imageView: Image {
        guard let selectedImage = selectedImage else {
            return Image(systemName: "photo")
        }
        return Image(uiImage: selectedImage)
    }
}

//MARK: - Preview

#Preview {
    ContentView()
}
