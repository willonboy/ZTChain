//
// ZTChain.swift
//
// GitHub Repo and Documentation: https://github.com/willonboy/ZTChain
//
// Copyright © 2024 Trojan Zhang. All rights reserved.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.
//


import Foundation

@dynamicMemberLookup
public struct ZTWrapper<Subject> {
    @usableFromInline let subject: Subject

    public init(_ subject: Subject) {
        self.subject = subject
    }

    @inlinable public subscript<Value>(
        dynamicMember keyPath: WritableKeyPath<Subject, Value>
    ) -> ((Value) -> ZTWrapper<Subject>) {
        var subject = self.subject
        return { value in
            subject[keyPath: keyPath] = value
            return ZTWrapper(subject)
        }
    }
    
    @inlinable public subscript<Value>(
        dynamicMember keyPath: ReferenceWritableKeyPath<Subject, Value>
    ) -> ((Value) -> ZTWrapper<Subject>) {
        return { value in
            self.subject[keyPath: keyPath] = value
            return self
        }
    }
    
    @discardableResult
    @inlinable public func call(_ function: (Subject) -> Void) -> ZTWrapper<Subject> {
        function(subject)
        return self
    }
    
    @discardableResult
    @inlinable public func build() -> Subject {
        return subject
    }
}

extension ZTWrapper where Subject: AnyObject {
    @discardableResult
    public func ref(_ s: inout Subject?) -> Self {
        s = self.subject
        return self
    }
}

public protocol ZTChain {
    associatedtype T
    var zt: ZTWrapper<T> { get }
}

extension ZTChain {
    public var zt: ZTWrapper<Self> {
        get { ZTWrapper(self) }
    }
}

/// Extend NSObject with `zt` proxy.
extension NSObject: ZTChain { }

