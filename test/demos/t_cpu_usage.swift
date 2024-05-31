//
//  t_cpu_usage.swift
//  test
//
//  Created by hx on 5/31/24.
//

import SwiftUI


struct t_cpu_usage: View {
    @State private var cpuUsage: Double = 0.0

    var body: some View {
        VStack {
            Text("CPU Usage: \(cpuUsage, specifier: "%.2f")%")
                .padding()
            
            Button("获取CPU信息") {
                get_cpu_info()
            }
        }
    }
    
    func get_cpu_info() {
        DispatchQueue.global(qos: .background).async {
            let usage: Double = hostCPULoadInfo()!
            DispatchQueue.main.async {
                self.cpuUsage = usage
            }
        }
    }

}


func hostCPULoadInfo() -> Double? {
    let HOST_CPU_LOAD_INFO_COUNT = MemoryLayout<host_cpu_load_info_data_t>.stride / MemoryLayout<integer_t>.stride
    var size = mach_msg_type_number_t(HOST_CPU_LOAD_INFO_COUNT)
    var cpuLoadInfo = host_cpu_load_info()

    let result = withUnsafeMutablePointer(to: &cpuLoadInfo) {
        $0.withMemoryRebound(to: integer_t.self, capacity: HOST_CPU_LOAD_INFO_COUNT) {
            host_statistics(mach_host_self(), HOST_CPU_LOAD_INFO, $0, &size)
        }
    }
    
    if result != KERN_SUCCESS {
        print("Error - \(#file): \(#function) - kern_result_t = \(result)")
        return nil
    }
    
    let userTime = Double(cpuLoadInfo.cpu_ticks.0)
    let systemTime = Double(cpuLoadInfo.cpu_ticks.1)
    let idleTime = Double(cpuLoadInfo.cpu_ticks.2)
    let niceTime = Double(cpuLoadInfo.cpu_ticks.3)

    let totalTime = userTime + systemTime + idleTime + niceTime
    let usedTime = userTime + systemTime + niceTime

    let cpuUsagePercentage = (usedTime / totalTime) * 100.0
    return cpuUsagePercentage
}


#Preview {
    t_cpu_usage()
}
