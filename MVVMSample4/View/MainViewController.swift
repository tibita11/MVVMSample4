//
//  MainViewController.swift
//  MVVMSample4
//
//  Created by 鈴木楓香 on 2023/02/06.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countUpButton: UIButton!
    @IBOutlet weak var countDownButton: UIButton!
    @IBOutlet weak var countRestButton: UIButton!
    
    private let disposeBag = DisposeBag()
    private var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel = ViewModel()
        let input = CounterViewModelInput(
            countUpButton: countUpButton.rx.tap.asObservable(),
            countDownButton: countDownButton.rx.tap.asObservable(),
            countRsetButton: countRestButton.rx.tap.asObservable()
            )
        viewModel.setup(input: input)
        
        viewModel.outputs?.counterText
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }
    

}
