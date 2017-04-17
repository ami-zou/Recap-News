//
//  PageViewController.swift
//  MiNews
//
//  Created by Ami Zou on 3/14/17.
//  Copyright © 2017 ECON327H. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    lazy var VCArr : [UIViewController] = { //lazy: initiated when called   //put "=" to initialize /compute property
        return [self.VCInstance(name: "LoadVC"),
                //self.VCInstance(name: "logoPage"),
                self.VCInstance(name: "statement"),
                self.VCInstance(name: "ArticleVC"),
                self.VCInstance(name: "SimpleCameraVC"),
                self.VCInstance(name: "ReportVC")]
    }()
    
    private func VCInstance(name: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
        //whenever it calls, return the "Main" storyboard, and initiate a new UIViewController with the passed name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad() //always call supper when override
        self.dataSource = self
        self.delegate = self
        if let firstVC = VCArr.first {
            setViewControllers([firstVC], direction: .forward, animated: true , completion: nil)
            //set the View Controller, start with the first; direction can be .forward or .reverse;
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews{
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            }else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    //tells the current ViewController what's come before and after the array
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        guard let viewControllerIndex = VCArr.index(of: viewController) else {
            return nil //if can't retrieve the current one, just return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else{ //greater than 0 is okay, can still retrieve a VC
            return VCArr.last //if no prev, go back to the last one: create a loop
        }
        guard VCArr.count > previousIndex else {
            return nil
        }
        return VCArr[previousIndex]
    }

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        guard let viewControllerIndex = VCArr.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < VCArr.count else{
            return VCArr.first
        }
        guard VCArr.count > nextIndex else {
            return nil
        }
        return VCArr[nextIndex]
    }
    
    //check how many VCs we have
    public func presentationCount(for pageViewController: UIPageViewController) -> Int{
        return VCArr.count
    }
    
    //check the current
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int{
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = VCArr.index(of: firstViewController) else{
                return 0 //index will be 0 in this case, if not found
        }
        return firstViewControllerIndex //found, return it
    }

}
