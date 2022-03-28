//
//  LottieFactory.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import Lottie

public class LottieFactory {
    public class func grayShimmer() -> AnimationView {
        let lottie = AnimationView(name: "shimmer-bar-gray", bundle: Bundle(for: LottieFactory.self))
        lottie.backgroundColor = .white
        lottie.loopMode = .loop
        return lottie
    }
}
