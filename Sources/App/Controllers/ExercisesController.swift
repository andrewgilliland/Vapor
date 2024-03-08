import Foundation
import Vapor

struct ExercisesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let exercises = routes.grouped("exercises")
        
        exercises.get(use: index)
    }
    
    func index(req: Request) async throws -> String {
        return "Exercises"
    }
}
