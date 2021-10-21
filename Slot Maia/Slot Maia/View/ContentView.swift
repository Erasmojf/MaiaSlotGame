//
//  ContentView.swift
//  Slot Maia
//
//  Created by Erasmo J.F Da Silva on 19/10/21.
//  SwiftUI ♡ Better Apps. Less Code
//  https://erasmojf.github.io/
//  Fidju de Bideira de Feira de Caracol

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape" ,"gfx-seven", "gfx-strawberry"]
    
    @State private var highscore: Int = 0
    @State private  var coins: Int = 100
    @State private var betAmount: Int = 10
    @State private var reels: Array = [0, 1, 2]
    @State private var showingInfoView: Bool = false
    @State private var isActiveBet10: Bool = false
    @State private var isActiveBet20: Bool = false
    
    // MARK: - FUNCTIONS
    func spinReels() {
//        reels[0] = Int.random(in: 0...symbols.count - 1)
//        reels[1] = Int.random(in: 0...symbols.count - 1)
//        reels[2] = Int.random(in: 0...symbols.count - 1)
        reels = reels.map({ _ in
            Int.random(in: 0...symbols.count - 1)
        })
    }
    
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
            // MARK: - PLAYER WINS
            playerWings()
            // MARK: - NEW HIGHSCORE
            if coins > highscore {
                newHighScore()
            }
            
        } else {
            // MARK: - PLAYER LOSES
            playerLoses()
        }
    }
    
    func playerWings() {
        coins += betAmount * 10
    }
    func newHighScore() {
        highscore = coins
    }
    func playerLoses() {
        coins -= betAmount
    }
    func activateBet20() {
        betAmount = 20
    }
    func activateBet10() {
        betAmount = 10
    }
    // MARK: - SPIN THE REELS
    // MARK: - CHECK THE WINNING
    
    
    // MARK: - GAME IS OVER
    
    
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
                        
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }//HStack
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highscore)")
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
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                    }//ZStack
                    
                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            RealView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        }//ZStack
                        Spacer()
                        // MARK: - REEL #3
                        ZStack {
                            RealView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                        }//ZStack
                    }
                    .frame(maxWidth: 500)
                    
                    // MARK: - SPIN BUTTON
                    Button(action: {
                        //SPIN THE REELS
                        self.spinReels()
                        
                        //CHECK WINNING
                        self.checkWinning()
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
                            self.activateBet20()
                            isActiveBet20 = true
                            isActiveBet10 = false
                            
                        }) {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet20 ? Color("ColorYellow") : Color.white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet20 ? 1 : 0)
                            .modifier(CasinoChipsModifier())
                        
                    }//HStack
                    
                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet10 ? 1 : 0)
                            .modifier(CasinoChipsModifier())
                        
                        Button(action: {
                            self.activateBet10()
                            isActiveBet10 = true
                            isActiveBet20 = false
                            
                        }) {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet10 ? Color("ColorYellow") : Color.white)
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
                    self.showingInfoView = true
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
        .sheet(isPresented: $showingInfoView) {
            InfoView()
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
