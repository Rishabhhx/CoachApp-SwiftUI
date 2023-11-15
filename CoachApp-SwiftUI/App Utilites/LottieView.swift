//
//  LottieView.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma(Work) on 28/04/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    var lottieFile: String = "background1"
    var loopMode: LottieLoopMode = .repeatBackwards(1)
    var animationView = LottieAnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = loopMode
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        animationView.play()
    }
}
