//
//  CodeDesignableView.swift
//  FootballPitch.kz
//
//  Created by Sharapat Azamat on 04.04.2022.
//

import Foundation
import UIKit

open class CodeDesignableView: UIView {

    public init() {
        super.init(frame: .zero)

        setupView()
        setupConstraints()
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    open func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    open func setupConstraints() {
        // Do nothing
    }
}
