//
//  ContentView.swift
//  ArsenicLevelFinder
//
//  Created by Arun Mohan on 25/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor = Color.red
    @State private var greenValue: Int = 0
    var gIntensity: Double = 0.0
    var pbCaluculator = PPBCalculator()
    var body: some View {
       
    VStack() {
        
        Text("PPB: \(self.pbCaluculator.calculatePPB(greenValue: self.greenValue)) ppb")
        
        Text("GIntesity: \(self.pbCaluculator.gIntensity)")
    
        Rectangle()
            .fill(selectedColor)
            .frame(width: 100, height: 100)
        
        ColorPicker("Select color from photo", selection: $selectedColor,supportsOpacity: true)
            .onReceive([self.selectedColor].publisher.first(), perform: { value in
            self.greenValue = self.pbCaluculator.getGreenColor(myColor: value)
            })
            .padding()
        
        PhotoLibraryView()
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PhotoLibraryView: View {
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    var body: some View {
        VStack {
                Image(uiImage: self.image)
                        .resizable()
                        .scaledToFill()
                    .frame(minWidth: 0, maxWidth: 200)
                        .edgesIgnoringSafeArea(.all)
         
                    Button(action: {
                        self.isShowPhotoLibrary = true
                    }) {
                        HStack {
                            Image(systemName: "photo")
                                .font(.system(size: 20))
         
                            Text("Photo library")
                                .font(.headline)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
}
