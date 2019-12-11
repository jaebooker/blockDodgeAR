//
//  ContentView.swift
//  blockDodge
//
//  Created by Jaeson Booker on 12/9/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func createBlockPosition(position: SCNVector3){
        var block = SCNBox(width: 5.0, height: 5.0, length: 10.0, chamferRadius: 0.1)
        var boxNode = SCNNode(geometry: block)
        boxNode.position(position)
        ARView.scene.el
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
