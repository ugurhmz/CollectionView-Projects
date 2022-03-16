import UIKit


class MainVC: UIViewController {
    
    
    let colors:[UIColor] = [.init(red: 142/255, green: 36/255, blue: 170/255, alpha: 1),
                            .init(red: 3/255, green: 169/255, blue: 244/255, alpha: 1),
                            .init(red: 255/255, green: 87/255, blue: 34/255, alpha: 1),
                            .init(red: 50/255, green: 200/255, blue: 80/255, alpha: 1),
                            .init(red: 126/255, green: 110/255, blue: 76/255, alpha: 1)]
    
    
    let generalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CustomCell.self,
                   forCellWithReuseIdentifier: CustomCell.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        generalCollectionView.backgroundColor = UIColor.white
        view.addSubview(generalCollectionView)
        addConstraintsToCollectionView()
        
        generalCollectionView.backgroundColor = .lightGray
        generalCollectionView.dataSource = self
        generalCollectionView.delegate = self
        
    }
    
   
}



//MARK: - Delegate, DataSource
extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    // HÜCRE SAYISI, Kaç Tane Hücre olacak
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    
    
    
    
    // cellForItemAt, Hücreye DATA DOLDURMA
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let cell = generalCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier,for: indexPath) as! CustomCell
        
        //cell.layer.cornerRadius = 20
       // cell.backgroundColor = colors[indexPath.row % colors.count]
        
        print("row",indexPath.row)
        
        switch indexPath.row {

            case 0:

                cell.imageView.image = UIImage(named: "car1")

            case 1:

                cell.imageView.image = UIImage(named: "car2")

            case 2:

                cell.imageView.image = UIImage(named: "car3")
            
            case 3:

                cell.imageView.image = UIImage(named: "car4")
           
            case 4:

                cell.imageView.image = UIImage(named: "car5")
            
            case 5:

                cell.imageView.image = UIImage(named: "car6")
                

            default:

                break

            }

            return cell
        
    }
    
    
    
}




//MARK: - DelegateFlowLayout
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    
    // sizeForItemAt, HER BİR HÜCRENİN BOYUTU (w,h)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // NOT -> Hücre Boyutu Yatayda = Ekran Genişliği - Yataydaki_Toplam_Boşluk.
        return CGSize(width: self.generalCollectionView.frame.size.width - 21,
                      height:180);
        
        
    }
    
    
    
    // dikeyde hücreler arası boşluk
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return CGFloat(25.0)
    }
    
    
    
    // Cell Outside
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 10 , bottom: 10, right: 10)
    }

}


extension MainVC {
    
     func addConstraintsToCollectionView(){
        NSLayoutConstraint.activate([
            generalCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            generalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            generalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            generalCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
