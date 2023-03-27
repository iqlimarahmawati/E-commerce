//
//  ViewController.swift
//  E-Commerce
//
//  Created by Iqlima Rahmawati on 24/03/23.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    
    var  viewModel : productListViewModel?
    var product : [ProductModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Product"
        setupTableView()
        setUpViewModel()
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ProductListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ProductListTableViewCell.identifier)
//                tableView.backgroundColor = .blue
    }
    func setUpViewModel() {
        self.viewModel = productListViewModel(urlString: "https://fakestoreapi.com/products", apiService: GetProductApi())
        self.viewModel?.bindListProductData = { productDataListModel in
            if let productDataListModel = productDataListModel{
                self.product = productDataListModel
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = product?.count ?? 0
//        print(count)
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductListTableViewCell.identifier, for: indexPath) as? ProductListTableViewCell else  { return UITableViewCell() }
        
        cell.ProductNameLabel.text = "\(product?[indexPath.row].title ?? "" )"
        cell.productPriceLabel.text = "$\(product?[indexPath.row].price ?? 0 )"
        cell.productImage.sd_setImage(with: URL(string: product?[indexPath.row].image ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "detailVC") as! ProductDetailViewController
        detailVC.product = product?[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}


// cara add Package
//file -> add packages/ swift packages -> copy paste url nya -> jangan lupa import
// contoh mau add packages SDWeb atau Algoritma, copy pastenya di add packages seetelah itu import di viewController lalu panggil link githubnya

