import Foundation
import Vapor

struct ExercisesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.grouped(AuthenticationMiddleware()).group("exercises") { route in
        
        route.get(use: getAllExercises)
        
        route.get(":exerciseId", use: getExerciseById )
        }
    }
    
    func getAllExercises(req: Request) async throws -> String {
        return "Exercises"
    }
    
    func getExerciseById(req: Request) async throws -> String {
        
        guard let exerciseId = req.parameters.get("exerciseId", as: String.self ) else {
            throw Abort(.internalServerError)
        }
        
        return "exerciseId: \(exerciseId)"
    }
}
