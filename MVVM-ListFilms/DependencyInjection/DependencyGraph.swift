//
//  DependencyGraph.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import Swinject

public final class DependencyGraph {
    public static func build() -> [Assembly] {
        return [
            FoudationAssembly(),
            ListAssembly(),
        ]
    }
}
