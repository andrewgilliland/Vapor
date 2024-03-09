import Vapor

func routes(_ app: Application) throws {
    app.middleware.use(LogMiddleware())
    try(app.register(collection: ExercisesController()))
}
