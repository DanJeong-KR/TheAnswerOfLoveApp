import UIKit
// LaunchScreen - rootViewController

class LaunchViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        imageView.image = UIImage(named: "image4")
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Love Ans"
        label.textColor = .white
        label.textAlignment = .center
        label.font =  UIFont(name: "Palatino", size: 40)
        label.alpha = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        //UIView.animate(withDuration: 1.5) { [weak label = self.label] in
//            label?.alpha = 1
//        }
        view.addSubview(imageView)
        view.addSubview(label)
        autolayout()
        
        UIView.animate(withDuration: 1.0,
                       animations: {
                        self.label.alpha = 1
                        self.imageView.alpha = 1
                        
        }) { (param) in
            Thread.sleep(forTimeInterval: 1)
            UIView.animate(withDuration: 1,
                           animations: {
                            self.label.alpha = 0
                            self.imageView.alpha = 0
            },
                           completion: { (param) in
                            let appDelegate =  UIApplication.shared.delegate as! AppDelegate
                            let naviVC = UINavigationController(rootViewController: FirstViewController())
                            naviVC.navigationBar.isHidden = true
                            appDelegate.window?.rootViewController = naviVC
            })
        }
        
        
//        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
//            let appDelegate =  UIApplication.shared.delegate as! AppDelegate
//            let naviVC = UINavigationController(rootViewController: FirstViewController())
//            naviVC.navigationBar.isHidden = true
//            appDelegate.window?.rootViewController = naviVC
//        }
    }
    
    func autolayout(){
        
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        
    }
}
