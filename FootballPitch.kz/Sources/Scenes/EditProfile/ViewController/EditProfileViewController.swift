//
//  EditProfileViewController.swift
//  FootballPitch.kz
//
//  Created by 123456 on 13.04.2022.
//

import UIKit
import MaterialComponents

class EditProfileViewController: UIViewController {
    
    private var skillLevels: [SkillLevelEnum] = [.beginner, .intermediate, .upper_intermediate, .advanced]
    private var footArray: [FootEnum] = [.right, .left]
    
    private var scrollView = UIScrollView()
    private var scrollContentView = UIView()
    
    private var skillPickerView = ToolbarPickerView()
    private var footPickerView = ToolbarPickerView()
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 16
        view.axis = .vertical
        return view
    }()
    
    private var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let fullNameTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        textField.placeholder = "Full Name"
        textField.label.text = "Full Name"
        textField.sizeToFit()
        return textField
    }()
    
    private let phoneTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        textField.label.text = "Phone number"
        textField.keyboardType = .numberPad
        textField.sizeToFit()
        return textField
    }()
    
    private let emailTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        textField.placeholder = "Email"
        textField.label.text = "Email"
        textField.sizeToFit()
        return textField
    }()
    
    private let positionTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        textField.placeholder = "Position(s)"
        textField.label.text = "Position(s)"
        textField.sizeToFit()
        return textField
    }()
    
    private let skillTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        textField.placeholder = "Skill level"
        textField.label.text = "Skill level"
        textField.sizeToFit()
        return textField
    }()
    
    private let footTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        textField.placeholder = "Strong Foot"
        textField.label.text = "Strong Foot"
        textField.sizeToFit()
        return textField
    }()
    
    private let heightTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        textField.placeholder = "Height(cm)"
        textField.label.text = "Height(cm)"
        textField.keyboardType = .numberPad
        textField.sizeToFit()
        return textField
    }()
    
    private let weightTextField: MDCOutlinedTextField = {
        let textField = MDCOutlinedTextField()
        textField.placeholder = "Weight(kg)"
        textField.label.text = "Weight(kg)"
        textField.keyboardType = .numberPad
        textField.sizeToFit()
        return textField
    }()
    
    private var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.palette(.accent)
        button.setTitle("Save details", for: .normal)
        button.setTitleColor(.palette(.white), for: .normal)
        button.titleLabel?.font = .semiboldPoppins(14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.height(constant: 40)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
}

//MARK: - Action
extension EditProfileViewController {
    @objc func handleScrollView() {
        dismissKeyboard()
    }
    
    @objc func handleSaveButton() {
        dismissKeyboard()
    }
}

// MARK: - UIPickerViewDataSource & UIPickerViewDelegate methods
extension EditProfileViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return skillLevels.count
        case 1:
            return footArray.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return skillLevels[row].title
        case 1:
            return footArray[row].title
        default:
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            skillTextField.text = skillLevels[row].title
        case 1:
            footTextField.text = footArray[row].title
        default:
            break
        }
    }
}

// MARK: - ToolbarPickerViewDelegate methods
extension EditProfileViewController: ToolbarPickerViewDelegate {
    func didTapDone() {
        dismissKeyboard()
    }
    
    func didTapCancel() {
        dismissKeyboard()
    }
}

//MARK: - CodeDesignable
extension EditProfileViewController: CodeDesignable {
    func setupViews() {
        title = "Edit Profile"
        view.backgroundColor = .palette(.white)
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleScrollView)))
        saveButton.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(stackView)
        
        setupStackView()
        setupTextFields()
        setupPickerViews()
        setupConstraints()
    }
    
    func setupStackView() {
        scrollView.alwaysBounceVertical = true
        [profileImageView, fullNameTextField, phoneTextField, emailTextField, positionTextField, skillTextField, footTextField, heightTextField, weightTextField, saveButton].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    func setupTextFields() {
        getTextFields().forEach {
            $0.autocorrectionType = .no
            $0.font = .regularPoppins(14)
            $0.label.font = .regularPoppins(12)
            
            $0.setOutlineColor(.palette(.black700), for: .normal)
            $0.setOutlineColor(.palette(.black700), for: .editing)
            
            $0.setNormalLabelColorForAllStates(.palette(.black800))
            $0.setFloatingLabelColorForAllStates(.palette(.black800))
            $0.setTextColorAllStates(.palette(.black900))
        }
                
        skillTextField.addTrailingImage(image: UIImage(named: "arrow_down"))
        footTextField.addTrailingImage(image: UIImage(named: "arrow_down"))
    }
    
    func setupPickerViews() {
        setPickerViews(field: skillTextField, view: skillPickerView, tag: 0)
        setPickerViews(field: footTextField, view: footPickerView, tag: 1)
        
        [skillPickerView, footPickerView].forEach {
            $0.dataSource = self
            $0.delegate = self
            $0.toolbarDelegate = self
            $0.reloadAllComponents()
        }
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { (m) in
            m.edges.equalToSuperview()
        }
        
        scrollContentView.snp.makeConstraints { (m) in
            m.top.equalToSuperview()
            m.leading.trailing.bottom.equalToSuperview()
            m.width.equalTo(scrollView.snp.width)
        }
        
        stackView.snp.makeConstraints { (m) in
            m.top.equalToSuperview().offset(16)
            m.left.equalToSuperview().offset(40)
            m.right.equalToSuperview().offset(-40)
            m.bottom.equalToSuperview().offset(-16)
        }
        
        profileImageView.snp.makeConstraints {
            $0.size.equalTo(80)
        }
    }
}

//MARK: - Helper
extension EditProfileViewController {
    private func dismissKeyboard() {
        getTextFields().forEach {
            $0.resignFirstResponder()
        }
    }
    
    private func getTextFields() -> [MDCOutlinedTextField] {
        return [fullNameTextField, phoneTextField, emailTextField, positionTextField, skillTextField, footTextField, heightTextField, weightTextField]
    }
    
    private func setPickerViews(field: MDCOutlinedTextField, view: ToolbarPickerView, tag: Int) {
        view.tag = tag
        field.inputView = view
        if let toolBar = view.pickerToolbar {
            field.inputAccessoryView = toolBar
        }
    }
}
