//
//  UploadView.swift
//  Insta
//
//  Created by addin on 07/07/21.
//

import SwiftUI

struct UploadView: View {
  
  @Environment(\.presentationMode) var presentationMode
  
  @EnvironmentObject var auth: Authentication
  @ObservedObject var presenter: UploadPresenter
  
  @State var image: UIImage? = nil
  @State var showImagePicker = false
  
  @State var captionText = ""
  
  var body: some View {
    Group {
      if presenter.isLoading {
        loadingIndicator
      } else if presenter.isError {
        errorIndicator
      } else {
        NavigationView {
        content
          .navigationBarTitle("", displayMode: .inline)
          .navigationBarItems(leading: cancelButton,
                              trailing: uploadButton
                                .disabled(image != nil ?  false : true))
        }
      }
    }
    .animation(.linear)
  }
}

extension UploadView {
  
  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle())
    }
  }
  
  var errorIndicator: some View {
    Text(presenter.errorMessage)
      .foregroundColor(.red)
      .padding()
  }
  
  var content: some View {
    ScrollView {
      VStack {
        Spacer()
        
        if image == nil {
          Button(action:
                  {
                    self.showImagePicker.toggle()
                  }) {
            Text("Choose photos")
          }
        }
        
        if image != nil {
          Image(uiImage: image!)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .shadow(radius: 10)
            .onTapGesture {
              self.showImagePicker.toggle()
            }
          
          TextField("Caption", text: $captionText)
            .padding()
          
        }
        Spacer()
      }
    }
    .sheet(isPresented: $showImagePicker, content: {
      ImagePicker(isShown: $showImagePicker, image: $image, sourceType: .photoLibrary)
    })
  }
  
  var cancelButton: some View {
    Button(action: {
      self.presentationMode.wrappedValue.dismiss()
    }) {
      Text("Cancel")
        .foregroundColor(.red)
    }
  }
  
  var uploadButton: some View {
    Button(action: {
      presenter.upload(post: UploadPostModel(caption: captionText != "" ? captionText : nil, image: image!, date: Date().getFormattedDate(format: "dd/MM/yyyy HH:mm"), user: UserModel(id: UUID().uuidString, email: auth.user.email, username: auth.user.username, photoUrl: auth.user.photoUrl))) {
        self.presentationMode.wrappedValue.dismiss()
      }
    }) {
      Text("Upload")
    }
  }
  
}



