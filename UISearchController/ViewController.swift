//
//  ViewController.swift
//  UISearchController
//
//  Created by StYiWe on 2020/9/16.
//  Copyright © 2020 stYiwe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDelegate, UITableViewDataSource {
    
    /// 搜索控制器
    var searchC : UISearchController!
    
    /// 展示列表
    var tableView : UITableView!
    
    //原始数据
    let dataList = ["阿狗", "阿毛", "兔子🐰", "鹰酱", "毛熊", "傻大木", "A", "BB", "狗大户", "He", "Dog", "big dog", "big yellow dog", "高卢🐔", "脚盆鸡", "秃子", "大毛", "二毛", "三毛", "$@"]
    
    //搜索数据
    var searchArr = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SearchController"
        self.view.backgroundColor = .white
        
        initSearchController()
        
        initTableView()
    }
    
    /// 初始化tableView
    func initTableView() {
        tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        //创建一个重用的单元格
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        self.view.addSubview(tableView)
    }
    
    
    /// 初始化搜索控制器
    func initSearchController() {
        searchC = UISearchController.init(searchResultsController: nil)
        searchC.searchResultsUpdater = self
        //设置placeholder
        searchC.searchBar.placeholder = "搜索内容"
        //设置为false，则搜索出来的内容可点击等操作
        searchC.obscuresBackgroundDuringPresentation = false
        //总是显示搜索框,如果不设置，会随着滚动而消失
        navigationItem.hidesSearchBarWhenScrolling = false
        //将搜索控制器加到导航栏上
        navigationItem.searchController = searchC
        
    }

    /// UISearchController代理，实时进行搜索
    func updateSearchResults(for searchController: UISearchController) {
        searchArr = dataList.filter({ (str) -> Bool in
            //localizedCaseInsensitiveContains 返回不区分大小写，包含的数据
            return str.localizedCaseInsensitiveContains(searchC.searchBar.text!)
        })
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchC.isActive ? searchArr.count : dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        cell.textLabel?.text = searchC.isActive ? searchArr[indexPath.row] : dataList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let str = searchC.isActive ? searchArr[indexPath.row] : dataList[indexPath.row]
        print(str)
    }
    
}

