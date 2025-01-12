//
//  GenericViews.swift
//  university_framework
//
//  Created by Sami Saleh on 1/11/25.
//

import UIKit

extension UISegmentedControl {
    /*************************************************************************
     *
     ************************************************************************/
    public func replaceSegments(segments: Array<String>) {
        self.removeAllSegments()
        for segment in segments {
            self.insertSegment(withTitle: segment, at: self.numberOfSegments, animated: false)
        }
    }

    /*************************************************************************
     *
     ************************************************************************/
    public func replaceSegmentsSystemImages(segments: Array<String>) {
        self.removeAllSegments()
        for segment in segments {
            self.insertSegment(with: UIImage(systemName: segment), at: self.numberOfSegments, animated: false)
        }
    }
}

class SegmentTabBarView: UIView {

    var segmentcontrol: UISegmentedControl = {
        let view = UISegmentedControl(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var delegate : SegmentTabBarViewDelegate?


    /// Initializer
    /// - Parameter frame: frame of the view
    override init(frame: CGRect) {
        super.init(frame: frame)

        layoutCustomViews()
    }

    /// Initializer required
    /// - Parameter coder: coder
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }

    /*************************************************************************
     *
     ************************************************************************/
    private func layoutCustomViews() {
        
        addSubview(segmentcontrol)
        segmentcontrol.addTarget(self, action: #selector(ValueChanged), for: .valueChanged)
        NSLayoutConstraint.activate([
            segmentcontrol.topAnchor.constraint(equalTo: topAnchor, constant: 4.0),
            segmentcontrol.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            segmentcontrol.rightAnchor.constraint(equalTo: rightAnchor, constant: -16.0),
            segmentcontrol.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2/3),
        ])        
    }

    /*************************************************************************
     *
     ************************************************************************/
    @objc func ValueChanged() {
        delegate?.SegmentSelectedIndex(value: segmentcontrol.selectedSegmentIndex)
    }

    /*************************************************************************
     *
     ************************************************************************/
    func ReplaceSegments(segments : [String]) {
        segmentcontrol.replaceSegmentsSystemImages(segments: segments)
    }

    /*************************************************************************
     *
     ************************************************************************/
    func SelectIndex(index : Int) {

        if index < segmentcontrol.numberOfSegments {
            segmentcontrol.selectedSegmentIndex = index
        }
    }



    /*************************************************************************
     *
     ************************************************************************/
    func SetColor(color : UIColor) {
        segmentcontrol.selectedSegmentTintColor = color.withAlphaComponent(0.50)
    }

}


public protocol SegmentTabBarViewDelegate {
    func SegmentSelectedIndex(value : Int)
}


