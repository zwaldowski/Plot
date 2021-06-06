/**
*  Plot
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

public extension Element where Context: XMLRootContext {
    /// Add an XML declaration node within the current context.
    /// - parameter attributes: The declaration's attributes.
    static func xml(_ attributes: Attribute<XML.DeclarationContext>...) -> Element {
        Element(name: "xml",
                closingMode: .neverClosed,
                nodes: attributes.map(\.node),
                paddingCharacter: "?")
    }

    /// Add an XML `doctype` declaration to the document.
    /// - parameter type: The type of document to declare.
    static func doctype(_ type: String) -> Element {
        Element(name: "!DOCTYPE", closingMode: .neverClosed, nodes: [
            Node<Context>.attribute(named: type)
        ])
    }
}
