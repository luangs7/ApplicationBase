//
//  AlertaViewController.swift
//  ApplicationBase
//
//  Created by Luan Silva on 02/10/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class AlertaViewController: UIViewController {
    var myArray = [Alerta]()
    let user = User.sharedInstance

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    fileprivate func setup(){
        for alerta in user.alertas{
            myArray.append(alerta)
        }
        setupTableView()
    }
    
    fileprivate func setupTableView(){
        setupNib(forClass: AgendaTableViewCell.self, nibName: "AgendaTableViewCell", reuseIdentifier: "AgendaCell")
        self.tableView.allowsSelection = false
    }
    
    fileprivate func setupNib(forClass aClass: AnyClass, nibName: String, reuseIdentifier: String) {
        let bundle = Bundle(for: aClass)
        let nib = UINib(nibName: nibName, bundle: bundle)
        self.tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
}

extension AlertaViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AgendaCell") as! AgendaTableViewCell
        
        let item = self.myArray[indexPath.row]
        
        //            cell.tipoLabel.text = item.dsDescr15
        //            cell.situacaoLabel.text = item.dsSituaca
        //            cell.cotaLabel.text = "\(item.nrPlano2)-\(item.nrDigito2)"
        //            cell.ordemLabel.text = item.nrSeqlan
        //            cell.lanceLabel.text = "\(item.nrDigito2)%"
        //
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}

