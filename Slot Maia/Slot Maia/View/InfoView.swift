//
//  InfoView.swift
//  Slot Maia
//
//  Created by Erasmo J.F Da Silva on 20/10/21.
//  SwiftUI ♡ Better Apps. Less Code
//  https://erasmojf.github.io/
//  Fidju de Bideira de Feira de Caracol

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "Maia / Difeimen")
                    FormRowView(firstItem: "Designer", secondItem: "Inocencia")
                    FormRowView(firstItem: "Music", secondItem: "Wes Madiko")
                    FormRowView(firstItem: "Website", secondItem: "maiagames.com")
                    FormRowView(firstItem: "Copyright", secondItem: "2021 All rights reserved.")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
                audioPlayer?.stop()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
                .padding(.top, 30)
                .padding(.trailing, 20)
                .accentColor(Color.secondary)
            , alignment: .topTrailing
        )
        .onAppear(perform: {
            playSound(sound: "background-music", type: "mp3")
        })
    }
}

struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundColor(Color.gray)
            Spacer()
            Text(secondItem)
        }//HStack
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}


