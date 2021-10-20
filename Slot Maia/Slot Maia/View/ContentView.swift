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
                VStack(alignment: .center, spacing: 0) {
                    // MARK: - REEL #1
                    ZStack {
                        RealView()
                        Image("gfx-bell")
                            .resizable()
                            .modifier(ImageModifier())
                    }//ZStack
                    
                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            RealView()
                            Image("gfx-seven")
                                .resizable()
                                .modifier(ImageModifier())
                        }//ZStack
                        Spacer()
                        // MARK: - REEL #3
                        ZStack {
                            RealView()
                            Image("gfx-cherry")
                                .resizable()
                                .modifier(ImageModifier())
                        }//ZStack
                    }
                    .frame(maxWidth: 500)
                    
                    
                    // MARK: - SPIN BUTTON
                    Button(action: {
                        print("Spin the reels")
                    }) {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                }// VStack
                .layoutPriority(2)
                
                // MARK: - FOOTER
                Spacer()
                
                HStack {
                    // MARK: - BET 20
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            print("Bet 20 coins")
                        }) {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(0)
                            .modifier(CasinoChipsModifier())
                        
                    }//HStack
                    
                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(1)
                            .modifier(CasinoChipsModifier())
                        
                        Button(action: {
                            print("Bet 10 coins")
                        }) {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.yellow)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                        
                        
                        
                    }//HStack
                }//HStack
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
