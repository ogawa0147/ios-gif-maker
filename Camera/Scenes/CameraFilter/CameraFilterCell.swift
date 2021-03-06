import UIKit
import Cartography

class CameraFilterCell: UICollectionViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.textAlignment = .center
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }

    private func addSubviews() {
        addSubview(titleLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        constrain(titleLabel) {
            $0.edges == $0.superview!.edges
        }
        layer.cornerRadius = min(frame.width, frame.height) * 0.1
        layer.masksToBounds = true
        backgroundColor = .lightGray
    }

    func bind(_ source: FilterSource) {
        titleLabel.text = source.title
        layoutIfNeeded()
    }
}

private extension FilterSource {
    var title: String {
        return type.rawValue
    }
}
