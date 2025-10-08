//: # SwiftStats
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 02 Apple Intellligence available?


import Foundation
import FoundationModels

let model = SystemLanguageModel.default

// The availability property provides detailed information on the model's state.
switch model.availability {
    case .available:
        print("Foundation Models is available and ready to go!")

    case .unavailable(.deviceNotEligible):
        print("The model is not available on this device.")

    case .unavailable(.appleIntelligenceNotEnabled):
        print("Apple Intelligence is not enabled in Settings.")

    case .unavailable(.modelNotReady):
        print("The model is not ready yet. Please try again later.")

    case .unavailable(let other):
        print("The model is unavailable for an unknown reason.")
}

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
