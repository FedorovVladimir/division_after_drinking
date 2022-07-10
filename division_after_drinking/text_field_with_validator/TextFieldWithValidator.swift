//
//  TextFieldWithValidator.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 10.07.2022.
//

import SwiftUI

struct FieldChecker {
    var errorMessage: String? = nil

    var valid: Bool {
        errorMessage == nil
    }
}

class FieldValidator<T>: ObservableObject where T: Hashable {
    typealias Validator = (T) -> String?

    @Binding private var bindValue: T
    @Binding private var checker: FieldChecker

    @Published var value: T {
        willSet {
            doValidate(newValue)
        }
        didSet {
            bindValue = value
        }
    }
    private let validator: Validator

    var isValid: Bool {
        checker.valid
    }
    var errorMessage: String? {
        checker.errorMessage
    }

    init(_ value: Binding<T>,
         checker: Binding<FieldChecker>,
         validator: @escaping Validator) {
        self.validator = validator
        self._bindValue = value
        self.value = value.wrappedValue
        self._checker = checker
    }

    func doValidate(_ newValue: T? = nil) -> Void {
        checker.errorMessage = (newValue != nil) ?
                validator(newValue!) :
                validator(value)
    }
}

struct TextFieldWithValidator: View {
    typealias Validator = (String) -> String?

    var title: String?

    @ObservedObject var field: FieldValidator<String>

    init(title: String = "", value: Binding<String>,
         checker: Binding<FieldChecker>,
         validator: @escaping Validator
    ) {
        self.title = title;
        field = FieldValidator(value, checker: checker, validator: validator)
    }

    var body: some View {
        VStack {
            TextField(title ?? "", text: $field.value)
                    .border(field.isValid ? Color.clear : Color.red)
                    .onAppear {
                        field.doValidate()
                    }
            if (!field.isValid) {
                Text(field.errorMessage ?? "")
                        .foregroundColor(Color.red)
            }
        }
    }
}