// The MIT License (MIT)
//
// Copyright (c) 2021 Alexander Grebenyuk (github.com/kean).

final class GenerateOptions {
    var access: String
    var paths: Paths
    var schemes: SchemesOptions
    var isGeneratingEnums: Bool
    var isGeneratingSwiftyBooleanPropertyNames: Bool
    var isInliningPrimitiveTypes: Bool
    var isReplacingCommonAcronyms: Bool
    var additionalAcronyms: [String]
    var fileHeader: FileHeader
    var comments: Comments
    var indentation: Indentation
    var spaceWidth: Int
    var isPluralizationEnabled: Bool
    var pluralizationExceptions: Set<String>
    var isInterpretingEmptyObjectsAsDictionary: Bool
    
    enum Indentation: String, Codable {
        case spaces
        case tabs
    }

    struct FileHeader {
        var addSwiftLintDisabled: Bool
        var addGetImport: Bool
        var header: String?
        
        init(_ fileHeader: GenerateOptionsScheme.FileHeader?) {
            self.addSwiftLintDisabled = fileHeader?.addSwiftLintDisabled ?? true
            self.addGetImport = fileHeader?.addGetImport ?? true
            self.header = fileHeader?.header
        }
    }
    
    struct Comments {
        var isEnabled: Bool
        var addTitle: Bool
        var addDescription: Bool
        var addExamples: Bool
        var addSummary: Bool
        var capitilizeTitle: Bool
        var capitilizeDescription: Bool
        
        init(_ comments: GenerateOptionsScheme.Comments?) {
            self.isEnabled = comments?.isEnabled ?? true
            self.addTitle = comments?.addTitle ?? true
            self.addDescription = comments?.addDescription ?? true
            self.addExamples = comments?.addExamples ?? true
            self.addSummary = comments?.addSummary ?? true
            self.capitilizeTitle = comments?.capitilizeTitle ?? true
            self.capitilizeDescription = comments?.capitilizeDescription ?? true
        }
    }
    
    struct Paths {
        var namespace: String
        
        init(_ paths: GenerateOptionsScheme.Paths?) {
            self.namespace = paths?.namespace ?? "Paths"
        }
    }
    
    // TODO: Inline this?
    struct SchemesOptions {
        var isGeneratingStructs: Bool
        var entitiesGeneratedAsClasses: Set<String>
        var entitiesGeneratedAsStructs: Set<String>
        var isMakingClassesFinal: Bool
        var baseClass: String?
        var adoptedProtocols: [String]
        var isGeneratingInitWithCoder: Bool
        // TODO: Move to separate "Rename" object
        var mappedPropertyNames: [String: String]
        var mappedTypeNames: [String: String] // Currently doesn't work for nested types
        
        init(_ schemes: GenerateOptionsScheme.SchemesOptions?) {
            self.isGeneratingStructs = schemes?.isGeneratingStructs ?? true
            self.entitiesGeneratedAsClasses = Set(schemes?.entitiesGeneratedAsClasses ?? [])
            self.entitiesGeneratedAsStructs = Set(schemes?.entitiesGeneratedAsStructs ?? [])
            self.isMakingClassesFinal = schemes?.isMakingClassesFinal ?? true
            self.baseClass = schemes?.baseClass
            self.isGeneratingInitWithCoder = schemes?.isGeneratingInitWithCoder ?? true
            self.adoptedProtocols = schemes?.adoptedProtocols ?? ["Decodable"]
            self.mappedPropertyNames = schemes?.mappedPropertyNames ?? [:]
            self.mappedTypeNames = schemes?.mappedTypeNames ?? [:]
        }
    }

    init(_ options: GenerateOptionsScheme = .init()) {
        self.access = options.access ?? "public"
        self.paths = Paths(options.paths)
        self.isGeneratingEnums = options.isGeneratingEnums ?? true
        self.isGeneratingSwiftyBooleanPropertyNames = options.isGeneratingSwiftyBooleanPropertyNames ?? true
        self.isInliningPrimitiveTypes = options.isInliningPrimitiveTypes ?? true
        self.isReplacingCommonAcronyms = options.isReplacingCommonAcronyms ?? true
        self.additionalAcronyms = (options.additionalAcronyms ?? []).map { $0.lowercased() }
        self.schemes = SchemesOptions(options.schemes)
        self.fileHeader = FileHeader(options.fileHeader)
        self.comments = Comments(options.comments)
        self.indentation = options.indentation ?? .spaces
        self.spaceWidth = options.spaceWidth ?? 4
        self.isPluralizationEnabled = options.isPluralizationEnabled ?? true
        self.pluralizationExceptions = Set(options.pluralizationExceptions ?? [])
        self.isInterpretingEmptyObjectsAsDictionary = options.isInterpretingEmptyObjectsAsDictionary ?? false
    }
}

final class GenerateOptionsScheme: Decodable {
    var access: String?
    var paths: Paths?
    var isGeneratingEnums: Bool?
    var isGeneratingSwiftyBooleanPropertyNames: Bool?
    var isInliningPrimitiveTypes: Bool?
    var isReplacingCommonAcronyms: Bool?
    var additionalAcronyms: [String]?
    var schemes: SchemesOptions?
    var fileHeader: FileHeader?
    var comments: Comments?
    var indentation: GenerateOptions.Indentation?
    var spaceWidth: Int?
    var isPluralizationEnabled: Bool?
    var pluralizationExceptions: [String]?
    var isInterpretingEmptyObjectsAsDictionary: Bool?
    
    struct FileHeader: Decodable {
        var addSwiftLintDisabled: Bool?
        var addGetImport: Bool?
        var header: String?
    }
    
    struct Comments: Decodable {
        var isEnabled: Bool?
        var addTitle: Bool?
        var addDescription: Bool?
        var addExamples: Bool?
        var addSummary: Bool?
        var capitilizeTitle: Bool?
        var capitilizeDescription: Bool?
    }
    
    struct Paths: Decodable {
        var namespace: String?
    }
    
    struct SchemesOptions: Decodable {
        var isGeneratingStructs: Bool?
        var entitiesGeneratedAsClasses: [String]?
        var entitiesGeneratedAsStructs: [String]?
        var isMakingClassesFinal: Bool?
        var baseClass: String?
        var adoptedProtocols: [String]?
        var isGeneratingInitWithCoder: Bool?
        var mappedPropertyNames: [String: String]?
        var mappedTypeNames: [String: String]?
    }
}

struct GenerateArguments {
    let isVerbose: Bool
    let isParallel: Bool
    let vendor: String?
    let package: String?
}
