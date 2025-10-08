//: # SwiftStats
//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
//: ## 01 FoundationModel

import Foundation
import FoundationModels

let instructions = """
    Your job is to create an itinerary for the user.
    Each day needs an activity, hotel and restaurant.

    Always include a title, a short description, and a day-by-day plan.
    """

let session = LanguageModelSession(instructions: instructions)
let response = try await session.respond(to: "Generate a 3-day itinerary to Iseo.")

//: [TOC](00TOC) | [Previous](@previous) | [Next](@next)
