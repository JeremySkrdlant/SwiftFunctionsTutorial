//
//  OneParameter.swift
//  FunctionsTutorial
//
//  Created by Jeremy Skrdlant on 9/1/23.
//

import SwiftUI

struct OneParameter: View {
    //We are using an array of strings to represent the different labels we have for each box.
    @State var labels:[String] = []
    @State var inputText = ""
    
    //This function takes one parameter. Even though the boxes are each brown, the label is different on each one because we have the option to pass a different string each time we call this function.  This function does not return anything.
    func addBox(boxLabel:String){
        labels.append(boxLabel)
        //clears out the textfield.
        inputText = ""
    }
    
    var body: some View {
        VStack{
            TextField("label", text: $inputText)
                .padding(2)
                .border(Color.gray)
                .padding()
            
            ScrollView{
                //Grid of 3 items each 100 pixels wide.
                LazyVGrid(columns: [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]){
                    //Loop from 0 to the number of boxes.
                    ForEach(labels, id:\.self){ label in
                        //Add 1 brown box with the label text to the grid for each label in the array.
                        Text(label)
                            .frame(width:100, height:100)
                            .background(Color.brown)
                            .foregroundColor(.white)
                    }
                }
            }
            //Pushes the button to the bottom of the screen.
            Spacer()
            //Our button has a title of addBox(boxLabel: "") The input text from above is automatically put in as a parameter here.
            Button("addBox(boxLabel:\"\(inputText)\")") {
                
                //Here is our function call.
                addBox(boxLabel: inputText)
            }
            .bold()
            .font(.system(size: 25))
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 6)
            .padding()
        }
    }
}

struct OneParameter_Previews: PreviewProvider {
    static var previews: some View {
        OneParameter()
    }
}
