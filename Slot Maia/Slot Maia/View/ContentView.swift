//
//  ContentView.swift
//  Slot Maia
//
//  Created by Erasmo J.F Da Silva on 19/10/21.
//  SwiftUI ♡ Better Apps. Less Code
//  https://erasmojf.github.io/
//  Fidju de Bideira de Feira de Caracol

import SwiftUI
// MARK: - PROPERTIES
struct ContentView: View {
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            // MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                // MARK: - HEADER
                LogoView()
                
                Spacer()
                // MARK: - SCORE
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("100")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }//HStack
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("200")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                       
                    }//HStack
                    .modifier(ScoreContainerModifier())
                }
                // MARK: - SLOT MACHINE
                // MARK: - FOOTER
                Spacer()
            }//VStack
            // MARK: - BUTTONS
            .overlay(
               //RESET
                Button(action: {
                    print("Reset the game")
                }) {
                    Image(systemName: "arrow.2.circlepath.circle")
                }
                    .modifier(ButtonsModifier()),
                alignment: .topLeading
                )
            
            .overlay(
               //INFO
                Button(action: {
                    print("Infor View")
                }) {
                    Image(systemName: "info.circle")
                }
                    .modifier(ButtonsModifier()),
                alignment: .topTrailing
                )
            .padding()
            .frame(maxWidth: 720)
            
            // MARK: - POPUP
        }//ZStack
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
