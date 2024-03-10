enum ForceType: String, Decodable, Encodable {
    case pull
    case push
    case `static`
    case compression
    case dynamicStretching
    case hinge
    case isometric
}
