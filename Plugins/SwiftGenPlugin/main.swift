//
//  main.swift
//  5AMSwiftGen
//
//  MIT License
//  Copyright (c) 2023 Peter Cammeraat (https://5am.is/xcode-project-plugins/)
//

import PackagePlugin
import Foundation

@main
struct SwiftGenPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let swiftGenConfigFile = target.directory.appending("swiftgen.yml")

        return [
            .prebuildCommand(
                displayName: "Running SwiftGen",
                executable: try context.tool(named: "swiftgen").path,
                arguments: [
                    "config",
                    "run",
                    "--config", "\(swiftGenConfigFile)"
                ],
                environment: [
                    "PROJECT_DIR": "\(context.package.directory)",
                    "TARGET_NAME": "\(target.name)",
                    "DERIVED_SOURCES_DIR": "\(context.pluginWorkDirectory)",
                ],
                outputFilesDirectory: context.pluginWorkDirectory
            )
        ]
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension SwiftGenPlugin: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
        let swiftGenConfigFile = context.xcodeProject.directory.appending("swiftgen.yml")
        let swiftGenOutputDir = context.xcodeProject.directory.appending("/Generated/")

        return [
            .prebuildCommand(
                displayName: "Running SwiftGen",
                executable: try context.tool(named: "swiftgen").path,
                arguments: [
                    "config",
                    "run",
                    "--config", "\(swiftGenConfigFile)"
                ],
                outputFilesDirectory: swiftGenOutputDir
            )
        ]
    }
}
#endif
