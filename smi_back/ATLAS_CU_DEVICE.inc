class: ASS_ATLAS_CU_DEVICE_CLASS/associated
!panel: ATLAS_CU_DEVICE.pnl
    state: READY	!color: FwStateOKPhysics
        action: GOTO_STANDBY	!visible: 1
        action: GOTO_SHUTDOWN	!visible: 1
    state: TRANSITION	!color: FwStateTransition
    state: STANDBY	!color: FwStateStandby
        action: GOTO_READY	!visible: 1
        action: GOTO_SHUTDOWN	!visible: 1
    state: NOT_READY	!color: FwStateOKNotPhysics
        action: GOTO_READY	!visible: 1
        action: GOTO_SHUTDOWN	!visible: 1
        action: GOTO_STANDBY	!visible: 1
    state: SHUTDOWN	!color: FwStateShutdown
        action: GOTO_READY	!visible: 1
        action: GOTO_STANDBY	!visible: 1
    state: UNKNOWN	!color: FwStateAttention2
