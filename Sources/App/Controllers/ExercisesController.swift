import Foundation
import Vapor

struct ExercisesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.grouped(AuthenticationMiddleware()).group("exercises") { route in
        
        route.get(use: getAllExercises)
        
        route.get(":exerciseId", use: getExerciseById)
            
        route.get("page", use: getExercisesPage)
        }
        
    }
    
    func getAllExercises(req: Request) async throws -> String {
        
        let exercises = try await Exercise.query(on: req.db).all()
        print(exercises)
        return "Exercises"
    }
    
    func getExerciseById(req: Request) async throws -> String {
        
        guard let exerciseId = req.parameters.get("exerciseId", as: String.self ) else {
            throw Abort(.internalServerError)
        }
        
        return "exerciseId: \(exerciseId)"
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
