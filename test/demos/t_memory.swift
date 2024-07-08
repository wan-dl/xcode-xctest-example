//
//  t_memory.swift
//  test
//
//  Created by apple on 5/31/24.
//

import SwiftUI

struct t_memory: View {
    
    @State var memoryUsage: Double = 0
    
    var body: some View {
        VStack {
            Text(String(format: "当前应用占用的内存: %.2f MB", memoryUsage))
            
            Button("点击获取内存", action: {
                self.memoryUsage = getAppMemoryUsage() ?? 0
            })
            .buttonStyle(.bordered)
        }
        .onAppear {
//            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
//                if let memoryUsage = getAppMemoryUsage() {
//                    self.memoryUsage = memoryUsage
//                    print("当前应用占用的内存: \(memoryUsage) MB")
//                }
//            }
        }
    }
    
    func getAppMemoryUsage() -> Double? {
        // 创建一个用于存储内存信息的结构体
        var info = task_vm_info_data_t()
        // 结构体大小
        var size = mach_msg_type_number_t(MemoryLayout.size(ofValue: info)) / 4

        // 获取当前任务的内存信息
        let result = withUnsafeMutablePointer(to: &info) { (infoPtr) -> kern_return_t in
            let infoRawPtr = UnsafeMutableRawPointer(infoPtr).assumingMemoryBound(to: integer_t.self)
            return task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), infoRawPtr, &size)
        }

        // 如果获取成功，返回内存使用情况（以MB为单位）
        if result == KERN_SUCCESS {
            let memoryUsageInBytes = info.phys_footprint
            return Double(memoryUsageInBytes) / (1024 * 1024)
        } else {
            return nil
        }
    }
}

#Preview {
    t_memory()
}
