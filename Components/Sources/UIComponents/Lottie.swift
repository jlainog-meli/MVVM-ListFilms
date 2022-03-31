import Lottie

public enum LottieFactory {
    public static func grayShimmer() -> AnimationView {
        let lottie = AnimationView(name: "shimmer-bar-gray", bundle: .module)
        lottie.backgroundColor = .white
        lottie.loopMode = .loop
        return lottie
    }
}
