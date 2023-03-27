//
//  ProductDetailViewController.swift
//  E-Commerce
//
//  Created by Iqlima Rahmawati on 24/03/23.
//

import UIKit

class ProductDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    static let identifier = "ProductDetailViewController"
    @IBOutlet weak var tableView: UITableView!
    
    //    var viewModel : productDetailViewModel?
    var product : ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ProductDetailTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProductDetailTableViewCell.identifier)
    }
    //    func setUpViewModel() {
    //        self.viewModel = productDetailViewModel(urlString: "https://fakestoreapi.com/products/1", apiService: GetProductApi())
    //        self.viewModel?.bindDetailProductData = { productDataDetailModel in
    //            if let productDataDetailModel = productDataDetailModel{
    //                self.product = productDataDetailModel
    //            }
    //            DispatchQueue.main.async {
    //                self.tableView.reloadData()
    //            }
    //        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTableViewCell.identifier, for: indexPath) as? ProductDetailTableViewCell else  { return UITableViewCell() }
        print(product)
        
        cell.productNameLabel.text = "\(product?.title ?? "")"
        cell.priceLabel.text = "$\(product?.price ?? 0)"
        cell.productImage.sd_setImage(with: URL(string: product?.image ?? ""))
        cell.Description.text = "\(product?.description ?? "" )"
        return cell
    }
}
    
