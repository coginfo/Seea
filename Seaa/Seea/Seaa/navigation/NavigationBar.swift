import Foundation
import UIKit


protocol NavButtonActionDelegate {
   func backButtonPressed(_ sender:UIButton)
   func searchButtonPressed(_ sender:UIButton)
   func menuButtonPressed(_ sender:UIButton)
}

final class NavigationBar: UIView {
    
    private static let NIB_NAME = "NavigationBar"
    
    @IBOutlet private var view: UIView!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var menuButton: UIButton!
    
    var delegate:NavButtonActionDelegate?
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var isbackButtonHidden: Bool {
        set {
            backButton.isHidden = newValue
        }
        get {
            return backButton.isHidden
        }
    }
    
    var issearchButtonEnabled: Bool {
        set {
            searchButton.isEnabled = newValue
        }
        get {
            return searchButton.isEnabled
        }
    }
    
    override func awakeFromNib() {
        initWithNib()
    }
    
    private func initWithNib() {
        Bundle.main.loadNibNamed(NavigationBar.NIB_NAME, owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
         self.backButton.addTarget(self, action: #selector(self.btnBackCustomisation_Click), for: .touchUpInside)
         self.searchButton.addTarget(self, action: #selector(self.btnSearchCustomisation_Click), for: .touchUpInside)
         self.menuButton.addTarget(self, action: #selector(self.btnMenuCustomisation_Click), for: .touchUpInside)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
            ]
        )
    }
    
    @objc func btnBackCustomisation_Click() {
        self.delegate?.backButtonPressed(self.backButton)
    }

    @objc func btnSearchCustomisation_Click() {
        self.delegate?.searchButtonPressed(self.searchButton)
    }
    
    @objc func btnMenuCustomisation_Click() {
        self.delegate?.menuButtonPressed(self.menuButton)
    }
}

