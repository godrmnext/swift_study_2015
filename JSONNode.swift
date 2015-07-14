enum JSONNode {
    case NullNode
    case StringNode(String)
    case NumberNode(Float)
    case BoolNode(Bool)
    case ArrayNode([JSONNode])
    case ObjectNode([String:JSONNode])
}

let x : JSONNode = .ArrayNode([
    .NumberNode(3.14),
    .StringNode("pi"),
    .BoolNode(false)])

func jsonStringify(json: JSONNode) -> String {
    var result = ""
    func nodeToString(node: JSONNode)-> String {
        switch node {
        case .NumberNode(let value):
            let xvalue = String(stringInterpolationSegment:value)
            return xvalue
        case .StringNode(let svalue):
            return "\"" + svalue + "\""
        case .BoolNode(let bvalue):
            return bvalue ? "true" : "false"
        case .ArrayNode(let values):
            var xresult = "["
            var count = 1
            for inode in values {
                xresult += jsonStringify(node)
                if (count<values.count) { xresult += "," }
                count++
            }
            xresult += "]"
            return xresult
        case .ObjectNode(let dic):
            var xresult = "("
            var count = 1
            for (key,dnode) in dic {
                xresult += key + " : "
                xresult += jsonStringify(dnode)
                if (count<dic.count) { xresult += "," }
                count++
            }
            xresult += ")"
            return xresult
        case .NullNode:
            return "nil"
        }
    }
    switch json {
    case .ArrayNode(let values):
        result += "["
        var count = 1;
        for inode in values {
            result += nodeToString(inode)
            if (count<values.count) { result += "," }
            count++
        }
        result += "]"
    case .ObjectNode(let dic):
        result += "("
        var count = 1
        for (key,dnode) in dic {
            result += key + " : "
            result += nodeToString(dnode)
            if (count<dic.count) { result += "," }
            count++
        }
        result += ")"
    default:
        result += nodeToString(json)
    }
    return result
}

jsonStringify(x)

let y : JSONNode = .ObjectNode(
[
"one" : .NullNode,
"two" : x,
"three": .StringNode("hi")
]
)

jsonStringify(y)

let z : JSONNode = .ArrayNode([
    .NumberNode(1.23),
    .ObjectNode(["xxx":x, "yyy":y]),
    .BoolNode(true)])

jsonStringify(z)
