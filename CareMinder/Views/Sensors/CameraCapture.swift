//
//  CameraCapture.swift
//  CareMinder
//
//  Created by Darko Krstevski on 13.2.24.
//

import Foundation
import SwiftUI

struct CameraCaptureView: View {
    @Binding var capturedImage: UIImage?
    @State private var isShowingImagePicker = false
    
    var body: some View {
        Button("Capture Image") {
            isShowingImagePicker.toggle()
        }
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(capturedImage: $capturedImage)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var capturedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No update needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.capturedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
