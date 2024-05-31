//
//  HomeView.swift
//  test
//
//  Created by apple on 5/20/24.
//

import SwiftUI
import Foundation
import MachO
import os

import UIKit

//func getAppMemoryUsage() -> Double? {
//    var info = task_vm_info_data_t()
//    var count = mach_msg_type_number_t(MemoryLayout<task_vm_info_data_t>.size) / 4
//
//    let result: kern_return_t = withUnsafeMutablePointer(to: &info) { ptr in
//        ptr.withMemoryRebound(to: integer_t.self, capacity: 1) { intPtr in
//            task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), intPtr, &count)
//        }
//    }
//    if result == KERN_SUCCESS {
//        let memoryUsageInBytes = info.phys_footprint
//        let memoryUsageInMB = Double(memoryUsageInBytes) / (1024 * 1024)
//        return memoryUsageInMB
//    } else {
//        return nil
//    }
//}



import UIKit



struct HomeView: View {
    
    @State var username: String = "你好, 火星"
    @State var memoryUsage: Double = 0
    
    var body: some View {
        
        VStack {
            Text(username)
            Text(String(format: "当前应用占用的内存: %.2f MB", memoryUsage))
            
            Button("open", action: {
                getAppMemoryUsage()
            })
        }
        .onAppear {
//            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
//                if let memoryUsage = getAppMemoryUsage() {
//                    self.memoryUsage = memoryUsage
//                    print("当前应用占用的内存: \(memoryUsage) MB")
//                } else {
//                    print("无法获取内存使用情况")
//                }
//            }
        }
    }
    
    func getAppMemoryUsage() -> Double? {
        // 创建一个结构体，用于存储内存信息
        var info = task_vm_info_data_t()
        // 设置一个变量来存储结构体的大小
        var count = mach_msg_type_number_t(MemoryLayout<task_vm_info_data_t>.size) / 4

        // 调用系统函数 task_info 获取应用程序的内存信息
        let result = withUnsafeMutableBytes(of: &info) { intPtr -> kern_return_t in
            // 将结构体内存转换为整数类型的指针
            let intPtr = intPtr.baseAddress!.assumingMemoryBound(to: integer_t.self)
            // 调用 task_info 函数获取内存信息
            return task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), intPtr, &count)
        }
        
        if result == KERN_SUCCESS {
            let memoryUsageInBytes = info.phys_footprint
            let memoryUsageInMB = Double(memoryUsageInBytes) / (1024 * 1024)
            return memoryUsageInMB
        } else {
            return nil
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
