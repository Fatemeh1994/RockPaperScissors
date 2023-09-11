//
//  GameView.swift
//  RockPaperScissors
//
//  Created by Fatemeh NajafiMoghadam on 9/10/23.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var gameViewModel = GameViewModel()

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.blue, Color(red: 0.2, green: 0.2, blue: 0.5)]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 50) {

                VStack {
                        Text("Siri chooses")
                    Text("\(gameViewModel.appMove)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Image(gameViewModel.appMove)
                            .buttonStyle()
                    }

                VStack {
                    Text("Now, try to")
                    Text("\(gameViewModel.winOrLoseText)")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(gameViewModel.playerWinLose ? Color.green : Color.red)

                }

                VStack(spacing: 5) {
                    HStack(spacing: 60) {
                        Text(Constants.rock)
                        Text(Constants.scissors)
                        Text(Constants.paper)
                    }
                    HStack {
                        ForEach(0 ..< 3) { item in
                            Button(action: {
                                gameViewModel.playerChoice(item)
                                gameViewModel.continueGame()
                            }) {
                                Image(gameViewModel.possibleMoves[item])
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .buttonStyle()
                            }
                        }
                    }
                }
            }
            .foregroundColor(.white)
        }
        .overlay(content: {
            Rectangle()
            .fill(.clear)
            .border(.white, width: 10)
            .padding()
        })
        .alert(isPresented: $gameViewModel.gameOver) {
            Alert(title: Text("Game over!"), message: Text("Your final score was \(gameViewModel.playerScore)/10"), dismissButton: .default(Text("Play again")) {
                gameViewModel.resetGame()
            })
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
