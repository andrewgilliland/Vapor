import Foundation
import Vapor
import MongoKitten

struct ExercisesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.grouped(AuthenticationMiddleware()).group("exercises") { route in
        
        route.get(use: getAllExercises)
        
        route.get(":exerciseId", use: getExerciseById)
            
        route.post(use: createExercise)
            
        route.get("page", use: getExercisesPage)
        }
        
    }
    
    func getAllExercises(req: Request) async throws -> [Exercise] {
        let exercises = try await Exercise.query(on: req.db).all()
        return exercises
    }
    
    func getExerciseById(req: Request) async throws -> Exercise {
        guard let exerciseId = req.parameters.get("exerciseId", as: ObjectId.self ) else {
            throw Abort(.internalServerError)
        }
        
        guard let exercise = try await Exercise.find(exerciseId, on: req.db) else {
            throw Abort(.badRequest)
        }
        
        return exercise
    }
    
    func createExercise(req: Request) async throws -> Exercise {
        let exercise = try req.content.decode(Exercise.self)
        try await exercise.save(on: req.db)
        return exercise
    }
    
    func getExercisesPage(req: Request) throws -> HTML {
        
       return HTML(value: """
          <html>
            <body>
              <h1>Hello, World!</h1>
            </body>
          </html>
          """)
    }
}
