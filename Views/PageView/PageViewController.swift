//
//  PageViewController.swift
//  Landmarks
//
//  Created by window1 on 2023/08/23.
//

/*
 UIKit와 인터페이스 => UI 오브젝트 들은 SwiftUI를 사용하고
 오브젝트들의 이동이나 데이터연결은 UIKit를 사용해보기
 */


import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    /* 뷰 컨트롤러를 구성할떄 UIKit에서 사용하던 Coordinator를 사용하기 위한 메서드 이를 통해
    delegates, data sources, 일반적인 코코아 패턴을 사용할 수 있다. */
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //초기 UIView 만드는 메서드
    func makeUIViewController(context: Context) ->  UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        return pageViewController
    }
    //뷰 컨트롤러를 업데이트 시켜주는 메서드
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    
    //SwiftUI에서 UIViewControllerRepresentable 유형의 코디네이터에 접근하기위한 것
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        
        //컨트롤러 간의 이동을 위한 코드 before
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        //컨트롤러 간의 이동을 위한 코드 after
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map({ UIHostingController(rootView: $0)})
        }
    }
    
}
