
import Vapor

struct LogMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        print("Log Middleware url: \(request.url)")
        return try await next.respond(to: request)
    }
}
