//
//  UploadView.swift
//  Insta
//
//  Created by addin on 07/07/21.
//

import SwiftUI

struct UploadView: View {
  
  @EnvironmentObject var auth: Authentication
  @ObservedObject var presenter: UploadPresenter
  
  @State var image: UIImage? = nil
  @State var showCaptureImageView = false

    var body: some View {
      content
    }
}

extension UploadView {
  
  var content: some View {
    ScrollView {
    VStack {
      Spacer()
      Button(action: {
        self.showCaptureImageView.toggle()
      }) {
        Text("Choose photos")
      }
      if image != nil {
        Image(uiImage: image!)
          .resizable()
          .scaledToFit()
          .frame(height: 200)
          .shadow(radius: 10)
      
      
      Button("upload") {
        presenter.upload(post: UploadPostModel(caption: "aaa", image: image!, date: Date().getFormattedDate(format: "dd/MM/yyyy HH:mm"), user: UserModel(id: UUID().uuidString, email: auth.user.email, username: auth.user.username, desc: "", photoUrl: "")))
      }
      }
      Spacer()
    }
    }
    .sheet(isPresented: $showCaptureImageView, content: {
      CaptureImageView(isShown: $showCaptureImageView, image: $image, sourceType: .photoLibrary)
    })
  }
  
}

struct CaptureImageView {
  @Binding var isShown: Bool
  @Binding var image: UIImage?
  var sourceType: UIImagePickerController.SourceType
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(isShown: $isShown, image: $image)
  }
}

extension CaptureImageView: UIViewControllerRepresentable {
  func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.sourceType = sourceType
    picker.delegate = context.coordinator
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController,
                              context: UIViewControllerRepresentableContext<CaptureImageView>) {
    
  }
}


class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  @Binding var isCoordinatorShown: Bool
  @Binding var imageInCoordinator: UIImage?
  
  init(isShown: Binding<Bool>, image: Binding<UIImage?>) {
    _isCoordinatorShown = isShown
    _imageInCoordinator = image
  }
  
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
    imageInCoordinator = unwrapImage
    isCoordinatorShown = false
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    isCoordinatorShown = false
  }
  
}

