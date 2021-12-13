// The MIT License (MIT)
//
// Copyright (c) 2021 Alexander Grebenyuk (github.com/kean).

import OpenAPIKit30
import Foundation
import GrammaticalNumber

// TODO: Add support for exploding query parameters (and disabling it); see edgecases
// TODO: Improve how Patch parameters are generated
// TODO: Add summary and description
// TODO: Figure out what to do with operationId
// TODO: Parse in: path parameters and support types other than just String
// TODO: Remove Markdown from description (or keep if it it looks OK - test)
// TODO: Add an option to generate a plain list of APIs instead of using namespaces
// TODO: Test that this enum description works enum: [user, poweruser, admin]
// TODO: Add support for deprecated methods
// TODO: Support path parameters like this GET /report.{format}
// TODO: Get path parameter type from the (first) operation

// TODO: Apply overridden names based on spec, not output file
// TODO: Generate phantom ID types
// TODO: Allow to override types for specific properties
// TODO: Add in documentation additional context, eg inlyvalues from 100 to 500
// TODO: Automatically apply more specific rename rules first

// TODO: Run everything throught SwiftLint again
extension Generator {
    
    #warning("refactor")
    var access: String { options.access.isEmpty ? "" :  options.access + " " }
    
    func paths() -> String {
        startMeasuring("generating paths (\(spec.paths.count))")
                
        // TODO: Only generate for one path
        var output = ""

        var generated = Set<OpenAPI.Path>()
                
        for path in spec.paths {
            var components: [String] = []
            let allComponents = path.key.components.isEmpty ? [""] : path.key.components
            for (index, component) in allComponents.enumerated() {
                components.append(component)
                let subpath = OpenAPI.Path(components)
                guard !generated.contains(subpath) else { continue }
                generated.insert(subpath)
                
                let component = components.last!
                let isLast = index == allComponents.endIndex - 1
                let isTopLevel = components.count == 1
                let type = component.isEmpty ? TypeName("Root") : makeType(component)
                let isParameter = component.starts(with: "{")
                let stat = isTopLevel ? "static " : ""
                
                let parents = Array(components.dropLast().map(makeType))
                let extensionOf = ([options.paths.namespace] + parents.map(\.rawValue)).joined(separator: ".")

                // TODO: percent-encode path?
                
                // TODO: Reuse type generation code
                
                if !isLast && spec.paths.contains(key: subpath) {
                    continue // Will be generated when the path is encountered
                }
                
                // TODO: refactor and add remaining niceness
                var generatedType = """
                    \(access)struct \(type) {
                        /// Path: `\(subpath.rawValue)`
                        \(access)let path: String\n
                """
                
                let context = Context(parents: parents + [type], namespace: arguments.module?.rawValue)
                if isLast {
                    generatedType += """
                    \n\(makeMethods(for: path.value, context: context))\n
                    """
                }
                
                generatedType += """
                    }
                """
                
                if isParameter {
                    let parameter = PropertyName(processing: component, options: options)
                    output += """
                    extension \(extensionOf) {
                        \(access)\(stat)func \(parameter)(_ \(parameter): String) -> \(type) {
                            \(type)(path: \(isTopLevel ? "\"/\(component)/\"" : "path + \"/\"") + \(parameter))
                        }
                    
                    \(generatedType)
                    }\n\n
                    """
                } else {
                    output += """
                    extension \(extensionOf) {
                        \(access)\(stat)var \(PropertyName(processing: type.rawValue, options: options)): \(type) {
                            \(type)(path: \(isTopLevel ? "\"/\(component)\"" : ("path + \"/\(components.last!)\"")))
                        }
                    
                    \(generatedType)
                    }\n\n
                    """
                }
            }
        }

        var extensions: [String] = []
        
        if isRequestOperationIdExtensionNeeded {
            extensions.append(templates.requestOperationIdExtension)
        }
        
        if isQueryParameterEncoderNeeded {
            extensions.append(templates.queryParameterEncoders(options.paths.queryParameterEncoders))
        }
        
        for value in extensions {
            output += "\n"
            output += value
        }
        
        var header = templates.fileHeader
        for value in makeImports() {
            header += "\nimport \(value)"
        }
        
        header += "\n\n"
        header += [options.access, "enum", options.paths.namespace, "{}"].compactMap { $0 }.joined(separator: " ")
        
        stopMeasuring("generating paths (\(spec.paths.count))")
        
        return (header + "\n\n" + output + "\n\n").indent(using: options)
    }
    
    private func makeImports() -> [String] {
        var imports = options.paths.imports
        if options.isRemovingUnneededImports && !isHTTPHeadersDependencyNeeded {
            imports.remove("APIClient")
        }
        return imports.sorted()
    }
    
    // TODO: Add remaining methods
    private func makeMethods(for item: OpenAPI.PathItem, context: Context) -> String {
        [
            item.get.flatMap { makeMethod($0, "get", context) },
            item.post.flatMap { makeMethod($0, "post", context) },
            item.put.flatMap { makeMethod($0, "put", context) },
            item.patch.flatMap { makeMethod($0, "patch", context) },
            item.delete.flatMap { makeMethod($0, "delete", context) },
            item.options.flatMap { makeMethod($0, "options", context) },
            item.head.flatMap { makeMethod($0, "head", context) },
            item.trace.flatMap { makeMethod($0, "trace", context) },
        ]
            .compactMap { $0 }
            .map { $0.indented }
            .joined(separator: "\n\n")
    }
        
    // TODO: Inject offset as a parameter
    // TODO: Add a way to disamiguate if responses have oneOf
    private func makeMethod(_ operation: OpenAPI.Operation, _ method: String, _ context: Context) -> String? {
        do {
            return try _makeMethod(for: operation, method: method, context: context)
        } catch {
            print("ERROR: Failed to generate path \(method) for \(operation.operationId ?? "\(operation)"): \(error)")
            return nil
        }
    }
    
    // TODO: Add support for header parameters
    private func _makeMethod(for operation: OpenAPI.Operation, method: String, context: Context) throws -> String {
        let responseType: String
        var responseHeaders: String?
        var nested: [String] = []
        // TODO: refactor
        if let response = getSuccessfulResponse(for: operation) {
            let responseValue = try makeResponse(for: response, method: method, context: context)
            responseType = responseValue.type.rawValue
            if let value = responseValue.nested {
                nested.append(value)
            }
            responseHeaders = try? makeHeaders(for: response, method: method)
        } else {
            responseType = "Void"
        }
        
        var output = templates.comments(for: .init(operation), name: "")

        var parameters: [String] = []
        var call: [String] = ["path"]

        let query = operation.parameters.compactMap { makeQueryParameter(for: $0, context: context) }
        if !query.isEmpty {
            let type = TypeName("\(method.capitalizingFirstLetter())Parameters")
            // TODO: create a single type describing this + add comments and stuff
            let properties = query.map {
                // TODO: pass metadata
                Property(name: makePropertyName($0.name), type: $0.type, isOptional: $0.isOptional, key: $0.name, schema: JSONSchema.string, metadata: nil)
            }
            let props = properties.map(templates.property).joined(separator: "\n")
            let initializer = templates.initializer(properties: properties)
            let toQuery = templates.toQueryParameters(properties: properties)
            nested.append(templates.entity(name: type, contents: [props, initializer, toQuery], protocols: []))
            let isOptional = query.allSatisfy { $0.isOptional }
            parameters.append("parameters: \(type)\(isOptional ? "? = nil" : "")")
            call.append("query: parameters\(isOptional ? "?" : "").asQuery()")
        }
        
        if let requestBody = operation.requestBody, method != "get" {
            let requestBody = try makeRequestBodyType(for: requestBody, method: method, context: context)
            if !requestBody.type.isVoid {
                if let value = requestBody.nested {
                    nested.append(value)
                }
                parameters.append("_ body: \(requestBody.type)\(requestBody.isOptional ? "? = nil" : "")")
                call.append("body: body")
            }
        }
        // TODO: Align this and contents based on the line count (and add option)
        var contents = ".\(method)(\(call.joined(separator: ", ")))"
        if options.paths.isAddingOperationIds, let operationId = operation.operationId, !operationId.isEmpty {
            setNeedsRequestOperationIdExtension()
            contents += ".id(\"\(operationId)\")"
        }
        // TODO: use properties instead of function when there are not arguments? (and add an option)
        output += templates.methodOrProperty(name: method, parameters: parameters, returning: "Request<\(responseType)>", contents: contents)
        if let headers = responseHeaders {
            output += "\n\n"
            output += headers
            setNeedsHTTPHeadersDependency()
        }
        for value in nested {
            output += "\n\n"
            output += value
        }
        return output.indented
    }
    
    private func makeQueryParameter(for input: Either<JSONReference<OpenAPI.Parameter>, OpenAPI.Parameter>, context: Context) -> QueryParameter? {
        do {
            guard let parameter = try _makeQueryParameter(for: input, context: context) else {
                return nil
            }
            guard options.paths.queryParameterEncoders.keys.contains(parameter.type.rawValue) else {
                throw GeneratorError("Unsupported parameter type: \(parameter.type)")
            }
            setNeedsQueryParameterEncoder()
            return parameter
        } catch {
            // TODO: Change to non-failing version
            print("ERROR: Fail to generate query parameter \(input.description)")
            return nil
        }
    }
    
    // TODO: Add support for other types (arrays, etc); currrently only basic built-in structs will works (see `Order`)
    // TODO: Why are all parameters optional?
    // TODO: Conveniecne args with a threshold
    private func _makeQueryParameter(for input: Either<JSONReference<OpenAPI.Parameter>, OpenAPI.Parameter>, context: Context) throws -> QueryParameter? {
        let parameter: OpenAPI.Parameter
        switch input {
        case .a(let reference):
            parameter = try reference.dereferenced(in: spec.components).underlyingParameter
        case .b(let value):
            parameter = value
        }
        guard parameter.context.inQuery else {
            return nil
        }
        let type: TypeName
        switch parameter.schemaOrContent {
        case .a(let schemaContext):
            let schema: JSONSchema
            switch schemaContext.schema {
            case .a(let reference):
                schema = JSONSchema.reference(reference)
            case .b(let value):
                schema = value
            }
            type = try makeProperty(key: parameter.name, schema: schema, isRequired: true, in: context).type
        case .b:
            throw GeneratorError("Parameter content map not supported for parameter: \(parameter.name)")
        }
        // TODO: use propertyCountThreshold
        return QueryParameter(
            description: parameter.description,
            isDeprecated: parameter.deprecated,
            name: parameter.name,
            type: type,
            isOptional: !parameter.required
        )
    }
    
    private typealias RequestBody = Either<JSONReference<OpenAPI.Request>, OpenAPI.Request>
    
    // TODO: Generate -parameter documentation
    // TODO: Automatically pick application/json (See Paths.Pet.WithPetID.PostRequest)
    // TODO: Add application/x-www-form-urlencoded support
    // TODO: Add text/plain support
    // TODO: Add binary support
    // TODO: Add "optional" support
    // TODO: Add "image*" support
    // TODO: Add anyOf, oneOf support
    // TODO: Add uploads support
    // TODO: Required?
    private func makeRequestBodyType(for requestBody: RequestBody, method: String, context: Context) throws -> GeneratedType {
        var context = context
        context.isDecodableNeeded = false
        
        // TODO: Refactor
        switch requestBody {
        case .a(let reference):
            guard let name = reference.name else {
                throw GeneratorError("Inalid reference")
            }
            guard let key = OpenAPI.ComponentKey(rawValue: name), let request = spec.components.requestBodies[key] else {
                throw GeneratorError("Failed to find a requesty body named \(name)")
            }
        
            if let content = request.content[.json] {
                // TODO: Add description
                // TODO: Parse example
                // TODO: Make sure this is correct
                let schema: JSONSchema
                switch content.schema {
                case .a(let reference):
                    schema = JSONSchema.reference(reference)
                case .b(let value):
                    schema = value
                default:
                    throw GeneratorError("Response not handled")
                }
                // TODO: This should be resused
                let type = try makeProperty(key: "\(method)Request", schema: schema, isRequired: true, in: context)
                setNeedsEncodable(for: type.type)
                return GeneratedType(type: type.type, nested: type.nested, isOptional: schema.isOptional)
            } else {
                throw GeneratorError("No supported content types: \(request.content.keys)")
            }
            
            #warning("TEMP")
            switch reference {
            case .internal(let reference):
                return GeneratedType(type: TypeName(reference.name ?? "Void"))
            case .external(_):
                throw GeneratorError("External references are not supported")
            }
        case .b(let scheme):
            if scheme.content.values.isEmpty {
                return GeneratedType(type: TypeName("Void"))
            } else if let content = scheme.content.values.first {
                // TODO: Parse example
                switch content.schema {
                case .a(let reference):
                    let type = try makeProperty(key: "\(method)Request", schema: JSONSchema.reference(reference), isRequired: true, in: context)
                    setNeedsEncodable(for: type.type)
                    return GeneratedType(type: type.type, nested: type.nested, isOptional: !scheme.required)
                case .b(let schema):
                    let type = try makeProperty(key: "\(method)Request", schema: schema, isRequired: true, in: context)
                    setNeedsEncodable(for: type.type)
                    return GeneratedType(type: type.type, nested: type.nested, isOptional: !scheme.required)
                default:
                    throw GeneratorError("Response not handled")
                }
            } else {
                throw GeneratorError("More than one schema in content which is not currently supported")
            }
        }
    }
    
    private typealias Response = Either<JSONReference<OpenAPI.Response>, OpenAPI.Response>

    // Only generate successfull responses.
    private func getSuccessfulResponse(for operation: OpenAPI.Operation) -> Response? {
        guard operation.responses.count > 1 else {
            return operation.responses.first { $0.key == .default || $0.key.isSuccess }?.value
        }
        return operation.responses.first { $0.key.isSuccess }?.value
    }
    
    // TODO: Refactor
    private struct GeneratedType {
        var type: TypeName
        var nested: String?
        var isOptional = false
    }

    // TODO: application/pdf and other binary files
    // TODO: 204 (empty response body)
    // TODO: Add response headers (TODO: where??), e.g. `X-RateLimit-Limit`
    // TODO: Add "descripton" to "- returns" comments
    private func makeResponse(for response: Response, method: String, context: Context) throws -> GeneratedType {
        var context = context
        context.isEncodableNeeded = false
        
        let schema: OpenAPI.Response
        switch response {
        case .a(let reference):
            switch reference {
            case .internal(let reference):
                guard let name = reference.name else {
                    throw GeneratorError("Response reference name is missing")
                }
                if let rename = options.paths.overrideResponses[name] {
                    return GeneratedType(type: TypeName(rename))
                }
                guard let key = OpenAPI.ComponentKey(rawValue: name), let value = spec.components.responses[key] else {
                    throw GeneratorError("Failed to find a response body")
                }
                schema = value
            case .external(_):
                throw GeneratorError("External references are not supported")
            }
        case .b(let value):
            schema = value
        }
        
        if schema.content.values.isEmpty {
            return GeneratedType(type: TypeName("Void"))
        } else if let content = schema.content[.json] {
            // TODO: Parse example
            switch content.schema {
            case .a(let reference):
                // TODO: what about nested types?
                let type = try makeProperty(key: "response", schema: JSONSchema.reference(reference), isRequired: true, in: context).type
                return GeneratedType(type: type)
            case .b(let schema):
                switch schema {
                case .string:
                    return GeneratedType(type: TypeName("String"))
                case .integer, .boolean:
                    return GeneratedType(type: TypeName("Data"))
                default:
                    // TODO: Add a way to cutomize which namespace to use
                    let property = try makeProperty(key: "\(method)Response", schema: schema, isRequired: true, in: context)
                    return GeneratedType(type: property.type, nested: property.nested)
                }
            default:
                throw GeneratorError("ERROR: response not handled")
            }
        } else if schema.content[.anyText] != nil {
            return GeneratedType(type: TypeName("String")) // Assume UTF8 encoding
        } else {
            throw GeneratorError("More than one schema in content which is not currently supported")
        }
    }
    
    // MARK: Headers

    private func makeHeaders(for response: Response, method: String) throws -> String? {
        guard options.paths.isAddingResponseHeaders, let headers = response.responseValue?.headers else {
            return nil
        }
        let contents: [String] = try headers.map { try makeHeader(key: $0, header: $1) }
        guard !contents.isEmpty else {
            return nil
        }
        let name = method.capitalizingFirstLetter() + "ResponseHeaders"
        return templates.headers(name: name, contents: contents.joined(separator: "\n"))
    }
    
    private func makeHeader(key: String, header input: Either<JSONReference<OpenAPI.Header>, OpenAPI.Header>) throws -> String {
        let header: OpenAPI.Header
        switch input {
        case .a(let reference):
            header = try reference.dereferenced(in: spec.components).underlyingHeader
        case .b(let value):
            header = value
        }
        switch header.schemaOrContent {
        case .a(let value):
            let schema: JSONSchema
            switch value.schema {
            case .a(let reference):
                schema = try reference.dereferenced(in: spec.components).jsonSchema
            case .b(let value):
                schema = value
            }
            let property = try makeProperty(key: key, schema: schema, isRequired: schema.required, in: Context(parents: []))
            return templates.header(for: property, header: header)
        case .b:
            throw GeneratorError("HTTP headers with content map are not supported")
        }
    }

    private func makeType(_ string: String) -> TypeName {
        let name = TypeName(processing: string, options: options)
        if string.starts(with: "{") {
            return name.prepending("With")
        }
        return name
    }
}

struct QueryParameter {
    let description: String?
    let isDeprecated: Bool
    let name: String
    let type: TypeName
    let isOptional: Bool
}
