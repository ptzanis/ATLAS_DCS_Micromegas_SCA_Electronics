class: ASS_ATLAS_DU_STATUS_CLASS/associated
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
        action: GOTO_WARNING	!visible: 1
        action: GOTO_ERROR	!visible: 1
        action: GOTO_FATAL	!visible: 1
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
        action: GOTO_ERROR	!visible: 0
        action: GOTO_FATAL	!visible: 0
        action: GOTO_UNINITIALIZED	!visible: 0
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
        action: GOTO_ERROR	!visible: 1
        action: GOTO_FATAL	!visible: 1
        action: GOTO_UNINITIALIZED	!visible: 1
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
        action: GOTO_WARNING	!visible: 1
        action: GOTO_FATAL	!visible: 1
        action: GOTO_UNINITIALIZED	!visible: 1
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
        action: GOTO_WARNING	!visible: 1
        action: GOTO_ERROR	!visible: 1
        action: GOTO_UNINITIALIZED	!visible: 1
