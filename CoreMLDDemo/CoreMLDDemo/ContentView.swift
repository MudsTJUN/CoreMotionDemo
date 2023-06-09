//
//  ContentView.swift
//  CoreMLDDemo
//
//  Created by 塚本隼 on 2023/03/20.
//

import SwiftUI
import CoreMotion
import CoreML

struct ContentView: View {
   
  @ObservedObject var mlModel = MyActivityClassifier_()
   
  var body: some View {
    var output_ = mlModel.output
    var mlPred = output_[0]
    var (label_, percentage_) = mlPred
    var mlPred1 = output_[1]
    var (label1_, percentage1_) = mlPred1
     
    VStack {
     
      HStack {
        Text(String(label_))
        Text(String(percentage_))
      }
      HStack {
        Text(String(label1_))
        Text(String(percentage1_))
      }
       
      Button(action: {
        self.mlModel.isStarted ? self.mlModel.stop(): self.mlModel.start()
        }) {
        self.mlModel.isStarted ? Text("STOP") : Text("START")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
