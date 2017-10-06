//
//  AgendaViewController.swift
//  ApplicationBase
//
//  Created by Luan Silva on 02/10/17.
//  Copyright © 2017 Squarebits. All rights reserved.
//

import UIKit

class AgendaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let user = User.sharedInstance
    var agendas = [Agenda]()
    var myArray = [Horario]()

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
        
        for agenda in user.agenda{
            myArray.append(contentsOf: agenda.horarios)
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

    extension AgendaViewController: UITableViewDelegate, UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.myArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AgendaCell") as! AgendaTableViewCell
            
            let item = self.myArray[indexPath.row]
            cell.status.text = item.status
            cell.title.text = item.atividade
            cell.local.text = item.local.descricao
            
            switch item.status {
            case "Pendente":
                cell.bar.backgroundColor =  UIColor(red:1.00, green:0.71, blue:0.26, alpha:1.0)
                 cell.status.textColor = UIColor(red:1.00, green:0.71, blue:0.26, alpha:1.0)
                break
            case "Cancelado":
                cell.bar.backgroundColor = UIColor(red:0.81, green:0.24, blue:0.24, alpha:1.0)
                cell.status.textColor = UIColor(red:0.81, green:0.24, blue:0.24, alpha:1.0)
                break
            case "Realizado":
                cell.bar.backgroundColor = UIColor(red:0.05, green:0.64, blue:0.54, alpha:1.0)
                cell.status.textColor = UIColor(red:0.05, green:0.64, blue:0.54, alpha:1.0)
                break
            default:
                break
            }
            
            
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
