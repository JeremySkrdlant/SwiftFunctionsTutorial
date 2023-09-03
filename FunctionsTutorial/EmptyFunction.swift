//
//  EmptyFunction.swift
//  FunctionsTutorial
//
//  Created by Jeremy Skrdlant on 9/1/23.
//

import SwiftUI

struct EmptyFunction: View {
    //These boxes are all the same so we just need to keep track of the number of them.
    @State var boxes = 0
    
    //This function doesn't take any parameters.  Therefore it will always behave the same way. This function doesn't return anything. 
    func addBox(){
        boxes += 1
    }
    
    var body: some View {
        VStack{
            ScrollView{
                //Grid of 3 items each 100 pixels wide.
                LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]){
                    //Loop from 0 to the number of boxes.
                    ForEach((0..<boxes), id:\.self){ _ in
                        //Add 1 green box to the grid for each time through the loop.
                        Color.green
                            .frame(width:100, height:100)
                    }
                }
            }
            //Pushes the button to the bottom of the screen.
            Spacer()
            //Our button has a title of addBox() and the action is the same. It calls our function on line 15.
            Button("addBox()") {
                addBox()
            }
            .bold()
            .font(.system(size: 30))
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 6)
            .padding()
        }
    }
}

struct EmptyFunction_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFunction()
    }
}
