//
// ZTChain.swift
//
// GitHub Repo and Documentation: https://github.com/willonboy/ZTChain
//
// Copyright © 2024 Trojan Zhang. All rights reserved.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//


import Foundation

@dynamicMemberLookup
public struct ZTWrapper<Subject> {
    public let subject: Subject

    public init(_ subject: Subject) {
        self.subject = subject
    }

    public subscript<Value>(
        dynamicMember keyPath: WritableKeyPath<Subject, Value>
    ) -> ((Value) -> ZTWrapper<Subject>) {
        var subject = self.subject
        return { value in
            subject[keyPath: keyPath] = value
            return ZTWrapper(subject)
        }
    }
    
    public subscript<Value>(
        dynamicMember keyPath: ReferenceWritableKeyPath<Subject, Value>
    ) -> ((Value) -> ZTWrapper<Subject>) {
        return { value in
            self.subject[keyPath: keyPath] = value
            return self
        }
    }
}

public protocol ZTWrapperCompatible {
    associatedtype T

    static var zt: ZTWrapper<T>.Type { get }

    var zt: ZTWrapper<T> { get }
}

extension ZTWrapperCompatible {
    public static var zt: ZTWrapper<Self>.Type {
        get { ZTWrapper<Self>.self }
    }

    public var zt: ZTWrapper<Self> {
        get { ZTWrapper(self) }
    }
}

/// Extend NSObject with `zt` proxy.
extension NSObject: ZTWrapperCompatible { }

