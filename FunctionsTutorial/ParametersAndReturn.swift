//
//  ParametersAndReturn.swift
//  FunctionsTutorial
//
//  Created by Jeremy Skrdlant on 9/1/23.
//

import SwiftUI

struct ParametersAndReturn: View {
    
    @State var inputedText = ""
    @State var wordCount = 0
    
    //This function takes one parameter of input and it returns an Int when it is done.
    func getWordCount(input:String)->Int{
        //We are assuming there is a space between each word.
        let words = inputedText.split(separator: " ")
        //This returns the number of strings we got split out of the original string. 
        return words.count
    }
    
    var body: some View {
        VStack{
            TextEditor(text: $inputedText)
                .border(Color.gray)
                .padding()
            Button("getWordCount(of:\"\(inputedText)\")") {
                
                //We are taking the return of the getWordCount function and storing it in the variable wordCount
                wordCount = getWordCount(input: inputedText)
            }
            .bold()
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 6)
            .padding()
            
            Text("returned \(wordCount)")
        }
    }
}

struct ParametersAndReturn_Previews: PreviewProvider {
    static var previews: some View {
        ParametersAndReturn()
    }
}
