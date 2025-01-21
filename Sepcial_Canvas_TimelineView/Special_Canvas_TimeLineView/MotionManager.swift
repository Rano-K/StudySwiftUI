//
//  MotionManager.swift
//  Special_Canvas_TimeLineView
//
//  Created by ms k on 12/20/24.
//

import Foundation
import CoreMotion

class MotionManager{
    private var motionManager = CMMotionManager()
    //휴대전화를 기울일 수 있는 세가지 속성 ( 실제 장치 방향을 알기 위한 속성들 )
    var pitch = 0.0
    var roll = 0.0
    var yaw = 0.0
    
    init(){
        motionManager.startDeviceMotionUpdates(to: OperationQueue()){[weak self] motion, error in
            guard let self = self, let motion = motion else { return }
            self.pitch = motion.attitude.pitch
            self.roll = motion.attitude.roll
            self.yaw = motion.attitude.yaw
        }
    }
    
    deinit{
        motionManager.stopDeviceMotionUpdates()
    }
}
