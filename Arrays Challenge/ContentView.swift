//
//  ContentView.swift
//  Arrays Challenge
//
//  Created by Betty Holberton on 10/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var mvpCheck = false
    @State private var s1Check = 0
    @State private var s2Check = 0
    
    /************************************
     * Start of MVP
     *
     * In the statement below (after the ?) set it equal to an array of your top 5
     * favorite movies. [The array is composed of String objects]
     ************************************/
    @State private var myFavoriteMovies : [String]? = ["Baby Driver", "Interstellar", "Smile 2", "Talk to Me", "The Amazing Spider-Man"]
    
    /*********************************
     * End of MVP
     ***********************************/
    
    var body: some View {
        VStack {
            Text("My all time favorite movie is")
            Text(myFavoriteMovies?.first ?? "")
                .font(.headline)
            List {
                ForEach(myFavoriteMovies ?? [""], id: \.self) { item in
                    Text(item)
                }
                .onMove(perform: { indices, newOffset in
                    myFavoriteMovies?.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            if mvpCheck {
                Text("MVP correct")
                    .padding()
                if s1Check == 0 {
                    Button("Test Stretch 1") {
                        s1Check = 1
                        if var myFavoriteMovies = myFavoriteMovies {
                            /************************************
                             * Start of Stretch 1
                             *
                             *  .  Change the second movie in the list to a different (new) movie.
                             *  .  Add another movie to the end of the list.
                             *  .  Insert another (new) movie into the third position in the list.
                             ************************************/
                            myFavoriteMovies[1] = "Avatar"
                            myFavoriteMovies.append("Rapphy 2")
                            myFavoriteMovies.insert("Rapphy 4", at: 2)
                            /*********************************
                             * End of Stretch 1
                             ***********************************/
                            
                            if  myFavoriteMovies[1] != self.myFavoriteMovies?[1] &&
                                    myFavoriteMovies.last != self.myFavoriteMovies?.last &&
                                    myFavoriteMovies[4] == self.myFavoriteMovies?[3] &&
                                    myFavoriteMovies.count == 7 {
                                s1Check = 2
                            }
                            self.myFavoriteMovies = myFavoriteMovies
                        }
                    }
                }
                else if s1Check == 1 {
                    Text("Stretch 1 incorrect, try again")
                }
                else {
                    Text("Stretch 1 correct")
                    if s2Check == 0 {
                        Button("Test Stretch 2") {
                            s2Check = 1
                            if var myFavoriteMovies = myFavoriteMovies {
                                /************************************
                                 * Start of Stretch 2
                                 *
                                 *  .  Remove the first two items on the list
                                 *  .  Remove the second item on the new list.
                                 *  .  Remove the last item on the list
                                 ************************************/
                                
                                myFavoriteMovies.remove(at: 0)
                                myFavoriteMovies.remove(at: 0)
                                myFavoriteMovies.remove(at: 1)
                                myFavoriteMovies.remove(at: (myFavoriteMovies.count - 1))
                                
                                /*********************************
                                 * End of Stretch 2
                                 ***********************************/
                                
                                if  myFavoriteMovies[0] == self.myFavoriteMovies?[2] &&
                                        myFavoriteMovies[2] == self.myFavoriteMovies?[5] &&
                                        myFavoriteMovies.last == self.myFavoriteMovies?[5] &&
                                        myFavoriteMovies.count == 3 {
                                    s2Check = 2
                                }
                                self.myFavoriteMovies = myFavoriteMovies
                            }
                        }
                        .padding()
                    }
                    else if s2Check == 1 {
                        Text("Stretch 2 incorrect, try again")
                            .padding()
                    }
                    else {
                        Text("Stretch 2 correct")
                            .padding()
                    }
                    Spacer()
                }
            }
            else {
                Text("MVP incorrect, try again")
            }
        }
        .environment(\.editMode, .constant(.active))
        .onAppear {
            if myFavoriteMovies?.count == 5 {
                mvpCheck = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
