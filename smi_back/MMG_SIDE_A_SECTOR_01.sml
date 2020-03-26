class: STATUS_EIZ2R1A01_LAYER1_PCB1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER1_PCB1 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER1_PCB1_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER1_PCB1_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB1_BOARD1,
	STATUS_EIZ2R1A01_LAYER1_PCB1_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB1_BOARD1,
	STATUS_EIZ2R1A01_LAYER1_PCB1_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER1_PCB1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER1_PCB1FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER1_PCB2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER1_PCB2 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER1_PCB2_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER1_PCB2_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB2_BOARD1,
	STATUS_EIZ2R1A01_LAYER1_PCB2_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB2_BOARD1,
	STATUS_EIZ2R1A01_LAYER1_PCB2_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER1_PCB2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER1_PCB2FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER1_PCB3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER1_PCB3 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD1,
	STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD2,
	STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD3,
	STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD1,
	STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD2,
	STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD3,
	STATUS_EIZ2R1A01_LAYER1_PCB3_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER1_PCB3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER1_PCB3FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER1_PCB4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER1_PCB4 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD1,
	STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD2,
	STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD3,
	STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD1,
	STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD2,
	STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD3,
	STATUS_EIZ2R1A01_LAYER1_PCB4_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER1_PCB4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER1_PCB4FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER1_PCB5TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER1_PCB5 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB5TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD1,
	STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD2,
	STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD3,
	STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD1,
	STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD2,
	STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD3,
	STATUS_EIZ2R1A01_LAYER1_PCB5_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER1_PCB5FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER1_PCB5FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER1 is_of_class STATUS_EIZ2R1A01_LAYER1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB1,
	STATUS_EIZ2R1A01_LAYER1_PCB2,
	STATUS_EIZ2R1A01_LAYER1_PCB3,
	STATUS_EIZ2R1A01_LAYER1_PCB4,
	STATUS_EIZ2R1A01_LAYER1_PCB5 }
objectset: STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER1_PCB1,
	STATUS_EIZ2R1A01_LAYER1_PCB2,
	STATUS_EIZ2R1A01_LAYER1_PCB3,
	STATUS_EIZ2R1A01_LAYER1_PCB4,
	STATUS_EIZ2R1A01_LAYER1_PCB5 }


objectset: STATUS_EIZ2R1A01_LAYER1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER1FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER1ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER2_PCB1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER2_PCB1 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER2_PCB1_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER2_PCB1_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB1_BOARD2,
	STATUS_EIZ2R1A01_LAYER2_PCB1_BOARD3 }
objectset: STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB1_BOARD2,
	STATUS_EIZ2R1A01_LAYER2_PCB1_BOARD3 }


objectset: STATUS_EIZ2R1A01_LAYER2_PCB1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER2_PCB1FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER2_PCB2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER2_PCB2 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER2_PCB2_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER2_PCB2_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB2_BOARD2,
	STATUS_EIZ2R1A01_LAYER2_PCB2_BOARD3 }
objectset: STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB2_BOARD2,
	STATUS_EIZ2R1A01_LAYER2_PCB2_BOARD3 }


objectset: STATUS_EIZ2R1A01_LAYER2_PCB2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER2_PCB2FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER2_PCB3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER2_PCB3 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER2_PCB3_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER2_PCB3_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB3_BOARD2,
	STATUS_EIZ2R1A01_LAYER2_PCB3_BOARD3 }
objectset: STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB3_BOARD2,
	STATUS_EIZ2R1A01_LAYER2_PCB3_BOARD3 }


objectset: STATUS_EIZ2R1A01_LAYER2_PCB3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER2_PCB3FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER2_PCB4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER2_PCB4 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER2_PCB4_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER2_PCB4_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB4_BOARD2,
	STATUS_EIZ2R1A01_LAYER2_PCB4_BOARD3 }
objectset: STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB4_BOARD2,
	STATUS_EIZ2R1A01_LAYER2_PCB4_BOARD3 }


objectset: STATUS_EIZ2R1A01_LAYER2_PCB4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER2_PCB4FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER2_PCB5TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER2_PCB5 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB5TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER2_PCB5_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER2_PCB5_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB5_BOARD2,
	STATUS_EIZ2R1A01_LAYER2_PCB5_BOARD3 }
objectset: STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB5_BOARD2,
	STATUS_EIZ2R1A01_LAYER2_PCB5_BOARD3 }


objectset: STATUS_EIZ2R1A01_LAYER2_PCB5FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER2_PCB5FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER2 is_of_class STATUS_EIZ2R1A01_LAYER2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB1,
	STATUS_EIZ2R1A01_LAYER2_PCB2,
	STATUS_EIZ2R1A01_LAYER2_PCB3,
	STATUS_EIZ2R1A01_LAYER2_PCB4,
	STATUS_EIZ2R1A01_LAYER2_PCB5 }
objectset: STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER2_PCB1,
	STATUS_EIZ2R1A01_LAYER2_PCB2,
	STATUS_EIZ2R1A01_LAYER2_PCB3,
	STATUS_EIZ2R1A01_LAYER2_PCB4,
	STATUS_EIZ2R1A01_LAYER2_PCB5 }


objectset: STATUS_EIZ2R1A01_LAYER2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER2FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER2ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER3_PCB1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER3_PCB1 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER3_PCB1_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER3_PCB1_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB1_BOARD1,
	STATUS_EIZ2R1A01_LAYER3_PCB1_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB1_BOARD1,
	STATUS_EIZ2R1A01_LAYER3_PCB1_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER3_PCB1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER3_PCB1FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER3_PCB2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER3_PCB2 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER3_PCB2_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER3_PCB2_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB2_BOARD1,
	STATUS_EIZ2R1A01_LAYER3_PCB2_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB2_BOARD1,
	STATUS_EIZ2R1A01_LAYER3_PCB2_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER3_PCB2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER3_PCB2FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER3_PCB3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER3_PCB3 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER3_PCB3_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER3_PCB3_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB3_BOARD1,
	STATUS_EIZ2R1A01_LAYER3_PCB3_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB3_BOARD1,
	STATUS_EIZ2R1A01_LAYER3_PCB3_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER3_PCB3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER3_PCB3FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER3_PCB4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER3_PCB4 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER3_PCB4_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER3_PCB4_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB4_BOARD1,
	STATUS_EIZ2R1A01_LAYER3_PCB4_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB4_BOARD1,
	STATUS_EIZ2R1A01_LAYER3_PCB4_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER3_PCB4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER3_PCB4FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER3_PCB5TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER3_PCB5 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB5TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER3_PCB5_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER3_PCB5_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB5_BOARD1,
	STATUS_EIZ2R1A01_LAYER3_PCB5_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB5_BOARD1,
	STATUS_EIZ2R1A01_LAYER3_PCB5_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER3_PCB5FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER3_PCB5FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER3 is_of_class STATUS_EIZ2R1A01_LAYER3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB1,
	STATUS_EIZ2R1A01_LAYER3_PCB2,
	STATUS_EIZ2R1A01_LAYER3_PCB3,
	STATUS_EIZ2R1A01_LAYER3_PCB4,
	STATUS_EIZ2R1A01_LAYER3_PCB5 }
objectset: STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER3_PCB1,
	STATUS_EIZ2R1A01_LAYER3_PCB2,
	STATUS_EIZ2R1A01_LAYER3_PCB3,
	STATUS_EIZ2R1A01_LAYER3_PCB4,
	STATUS_EIZ2R1A01_LAYER3_PCB5 }


objectset: STATUS_EIZ2R1A01_LAYER3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER3FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER3ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER4_PCB1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER4_PCB1 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER4_PCB1_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER4_PCB1_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB1_BOARD2,
	STATUS_EIZ2R1A01_LAYER4_PCB1_BOARD3 }
objectset: STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB1_BOARD2,
	STATUS_EIZ2R1A01_LAYER4_PCB1_BOARD3 }


objectset: STATUS_EIZ2R1A01_LAYER4_PCB1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER4_PCB1FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER4_PCB2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER4_PCB2 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER4_PCB2_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER4_PCB2_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB2_BOARD2,
	STATUS_EIZ2R1A01_LAYER4_PCB2_BOARD3 }
objectset: STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB2_BOARD2,
	STATUS_EIZ2R1A01_LAYER4_PCB2_BOARD3 }


objectset: STATUS_EIZ2R1A01_LAYER4_PCB2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER4_PCB2FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER4_PCB3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER4_PCB3 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD1,
	STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD2,
	STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD3,
	STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD1,
	STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD2,
	STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD3,
	STATUS_EIZ2R1A01_LAYER4_PCB3_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER4_PCB3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER4_PCB3FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER4_PCB4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER4_PCB4 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD1,
	STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD2,
	STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD3,
	STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD1,
	STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD2,
	STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD3,
	STATUS_EIZ2R1A01_LAYER4_PCB4_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER4_PCB4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER4_PCB4FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER4_PCB5TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER4_PCB5 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB5TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD1 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD2 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD3 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD4 is_of_class STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD1,
	STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD2,
	STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD3,
	STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD4 }
objectset: STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD1,
	STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD2,
	STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD3,
	STATUS_EIZ2R1A01_LAYER4_PCB5_BOARD4 }


objectset: STATUS_EIZ2R1A01_LAYER4_PCB5FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER4_PCB5FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01_LAYER4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01_LAYER4 is_of_class STATUS_EIZ2R1A01_LAYER4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWDM is_of_class STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB1,
	STATUS_EIZ2R1A01_LAYER4_PCB2,
	STATUS_EIZ2R1A01_LAYER4_PCB3,
	STATUS_EIZ2R1A01_LAYER4_PCB4,
	STATUS_EIZ2R1A01_LAYER4_PCB5 }
objectset: STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER4_PCB1,
	STATUS_EIZ2R1A01_LAYER4_PCB2,
	STATUS_EIZ2R1A01_LAYER4_PCB3,
	STATUS_EIZ2R1A01_LAYER4_PCB4,
	STATUS_EIZ2R1A01_LAYER4_PCB5 }


objectset: STATUS_EIZ2R1A01_LAYER4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01_LAYER4FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01_LAYER4ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R1A01TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R1A01ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R1A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R1A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R1A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R1A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R1A01 is_of_class STATUS_EIZ2R1A01TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R1A01ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R1A01ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R1A01ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R1A01ATLAS_STATUS_FWDM is_of_class STATUS_EIZ2R1A01ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01_LAYER1,
	STATUS_EIZ2R1A01_LAYER2,
	STATUS_EIZ2R1A01_LAYER3,
	STATUS_EIZ2R1A01_LAYER4 }
objectset: STATUS_EIZ2R1A01ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01_LAYER1,
	STATUS_EIZ2R1A01_LAYER2,
	STATUS_EIZ2R1A01_LAYER3,
	STATUS_EIZ2R1A01_LAYER4 }


objectset: STATUS_EIZ2R1A01FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R1A01ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R1A01FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R1A01ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER1_PCB6TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER1_PCB6 is_of_class STATUS_EIZ2R2A01_LAYER1_PCB6TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD1 is_of_class STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD2 is_of_class STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD3 is_of_class STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD4 is_of_class STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD1,
	STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD2,
	STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD3,
	STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD4 }
objectset: STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD1,
	STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD2,
	STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD3,
	STATUS_EIZ2R2A01_LAYER1_PCB6_BOARD4 }


objectset: STATUS_EIZ2R2A01_LAYER1_PCB6FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER1_PCB6FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER1_PCB7TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER1_PCB7 is_of_class STATUS_EIZ2R2A01_LAYER1_PCB7TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER1_PCB7_BOARD1 is_of_class STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER1_PCB7_BOARD4 is_of_class STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER1_PCB7_BOARD1,
	STATUS_EIZ2R2A01_LAYER1_PCB7_BOARD4 }
objectset: STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER1_PCB7_BOARD1,
	STATUS_EIZ2R2A01_LAYER1_PCB7_BOARD4 }


objectset: STATUS_EIZ2R2A01_LAYER1_PCB7FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER1_PCB7FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER1_PCB8TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER1_PCB8 is_of_class STATUS_EIZ2R2A01_LAYER1_PCB8TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER1_PCB8_BOARD1 is_of_class STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER1_PCB8_BOARD4 is_of_class STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER1_PCB8_BOARD1,
	STATUS_EIZ2R2A01_LAYER1_PCB8_BOARD4 }
objectset: STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER1_PCB8_BOARD1,
	STATUS_EIZ2R2A01_LAYER1_PCB8_BOARD4 }


objectset: STATUS_EIZ2R2A01_LAYER1_PCB8FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER1_PCB8FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER1 is_of_class STATUS_EIZ2R2A01_LAYER1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER1_PCB6,
	STATUS_EIZ2R2A01_LAYER1_PCB7,
	STATUS_EIZ2R2A01_LAYER1_PCB8 }
objectset: STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER1_PCB6,
	STATUS_EIZ2R2A01_LAYER1_PCB7,
	STATUS_EIZ2R2A01_LAYER1_PCB8 }


objectset: STATUS_EIZ2R2A01_LAYER1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER1FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER1ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER2_PCB6TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER2_PCB6 is_of_class STATUS_EIZ2R2A01_LAYER2_PCB6TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER2_PCB6_BOARD2 is_of_class STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER2_PCB6_BOARD3 is_of_class STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER2_PCB6_BOARD2,
	STATUS_EIZ2R2A01_LAYER2_PCB6_BOARD3 }
objectset: STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER2_PCB6_BOARD2,
	STATUS_EIZ2R2A01_LAYER2_PCB6_BOARD3 }


objectset: STATUS_EIZ2R2A01_LAYER2_PCB6FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER2_PCB6FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER2_PCB7TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER2_PCB7 is_of_class STATUS_EIZ2R2A01_LAYER2_PCB7TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER2_PCB7_BOARD2 is_of_class STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER2_PCB7_BOARD3 is_of_class STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER2_PCB7_BOARD2,
	STATUS_EIZ2R2A01_LAYER2_PCB7_BOARD3 }
objectset: STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER2_PCB7_BOARD2,
	STATUS_EIZ2R2A01_LAYER2_PCB7_BOARD3 }


objectset: STATUS_EIZ2R2A01_LAYER2_PCB7FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER2_PCB7FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER2_PCB8TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER2_PCB8 is_of_class STATUS_EIZ2R2A01_LAYER2_PCB8TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER2_PCB8_BOARD2 is_of_class STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER2_PCB8_BOARD3 is_of_class STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER2_PCB8_BOARD2,
	STATUS_EIZ2R2A01_LAYER2_PCB8_BOARD3 }
objectset: STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER2_PCB8_BOARD2,
	STATUS_EIZ2R2A01_LAYER2_PCB8_BOARD3 }


objectset: STATUS_EIZ2R2A01_LAYER2_PCB8FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER2_PCB8FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER2 is_of_class STATUS_EIZ2R2A01_LAYER2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER2_PCB6,
	STATUS_EIZ2R2A01_LAYER2_PCB7,
	STATUS_EIZ2R2A01_LAYER2_PCB8 }
objectset: STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER2_PCB6,
	STATUS_EIZ2R2A01_LAYER2_PCB7,
	STATUS_EIZ2R2A01_LAYER2_PCB8 }


objectset: STATUS_EIZ2R2A01_LAYER2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER2FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER2ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER3_PCB6TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER3_PCB6 is_of_class STATUS_EIZ2R2A01_LAYER3_PCB6TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER3_PCB6_BOARD1 is_of_class STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER3_PCB6_BOARD4 is_of_class STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER3_PCB6_BOARD1,
	STATUS_EIZ2R2A01_LAYER3_PCB6_BOARD4 }
objectset: STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER3_PCB6_BOARD1,
	STATUS_EIZ2R2A01_LAYER3_PCB6_BOARD4 }


objectset: STATUS_EIZ2R2A01_LAYER3_PCB6FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER3_PCB6FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER3_PCB7TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER3_PCB7 is_of_class STATUS_EIZ2R2A01_LAYER3_PCB7TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER3_PCB7_BOARD1 is_of_class STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER3_PCB7_BOARD4 is_of_class STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER3_PCB7_BOARD1,
	STATUS_EIZ2R2A01_LAYER3_PCB7_BOARD4 }
objectset: STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER3_PCB7_BOARD1,
	STATUS_EIZ2R2A01_LAYER3_PCB7_BOARD4 }


objectset: STATUS_EIZ2R2A01_LAYER3_PCB7FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER3_PCB7FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER3_PCB8TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER3_PCB8 is_of_class STATUS_EIZ2R2A01_LAYER3_PCB8TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER3_PCB8_BOARD1 is_of_class STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER3_PCB8_BOARD4 is_of_class STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER3_PCB8_BOARD1,
	STATUS_EIZ2R2A01_LAYER3_PCB8_BOARD4 }
objectset: STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER3_PCB8_BOARD1,
	STATUS_EIZ2R2A01_LAYER3_PCB8_BOARD4 }


objectset: STATUS_EIZ2R2A01_LAYER3_PCB8FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER3_PCB8FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER3 is_of_class STATUS_EIZ2R2A01_LAYER3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER3_PCB6,
	STATUS_EIZ2R2A01_LAYER3_PCB7,
	STATUS_EIZ2R2A01_LAYER3_PCB8 }
objectset: STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER3_PCB6,
	STATUS_EIZ2R2A01_LAYER3_PCB7,
	STATUS_EIZ2R2A01_LAYER3_PCB8 }


objectset: STATUS_EIZ2R2A01_LAYER3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER3FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER3ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER4_PCB6TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER4_PCB6 is_of_class STATUS_EIZ2R2A01_LAYER4_PCB6TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD1 is_of_class STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD2 is_of_class STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD3 is_of_class STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD4 is_of_class STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD1,
	STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD2,
	STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD3,
	STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD4 }
objectset: STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD1,
	STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD2,
	STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD3,
	STATUS_EIZ2R2A01_LAYER4_PCB6_BOARD4 }


objectset: STATUS_EIZ2R2A01_LAYER4_PCB6FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER4_PCB6FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER4_PCB7TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER4_PCB7 is_of_class STATUS_EIZ2R2A01_LAYER4_PCB7TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER4_PCB7_BOARD2 is_of_class STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER4_PCB7_BOARD3 is_of_class STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER4_PCB7_BOARD2,
	STATUS_EIZ2R2A01_LAYER4_PCB7_BOARD3 }
objectset: STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER4_PCB7_BOARD2,
	STATUS_EIZ2R2A01_LAYER4_PCB7_BOARD3 }


objectset: STATUS_EIZ2R2A01_LAYER4_PCB7FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER4_PCB7FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER4_PCB8TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER4_PCB8 is_of_class STATUS_EIZ2R2A01_LAYER4_PCB8TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ2R2A01_LAYER4_PCB8_BOARD2 is_of_class STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ2R2A01_LAYER4_PCB8_BOARD3 is_of_class STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER4_PCB8_BOARD2,
	STATUS_EIZ2R2A01_LAYER4_PCB8_BOARD3 }
objectset: STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER4_PCB8_BOARD2,
	STATUS_EIZ2R2A01_LAYER4_PCB8_BOARD3 }


objectset: STATUS_EIZ2R2A01_LAYER4_PCB8FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER4_PCB8FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01_LAYER4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01_LAYER4 is_of_class STATUS_EIZ2R2A01_LAYER4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWDM is_of_class STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER4_PCB6,
	STATUS_EIZ2R2A01_LAYER4_PCB7,
	STATUS_EIZ2R2A01_LAYER4_PCB8 }
objectset: STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER4_PCB6,
	STATUS_EIZ2R2A01_LAYER4_PCB7,
	STATUS_EIZ2R2A01_LAYER4_PCB8 }


objectset: STATUS_EIZ2R2A01_LAYER4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01_LAYER4FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01_LAYER4ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ2R2A01TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ2R2A01ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ2R2A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ2R2A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ2R2A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ2R2A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ2R2A01 is_of_class STATUS_EIZ2R2A01TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ2R2A01ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ2R2A01ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ2R2A01ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ2R2A01ATLAS_STATUS_FWDM is_of_class STATUS_EIZ2R2A01ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R2A01_LAYER1,
	STATUS_EIZ2R2A01_LAYER2,
	STATUS_EIZ2R2A01_LAYER3,
	STATUS_EIZ2R2A01_LAYER4 }
objectset: STATUS_EIZ2R2A01ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R2A01_LAYER1,
	STATUS_EIZ2R2A01_LAYER2,
	STATUS_EIZ2R2A01_LAYER3,
	STATUS_EIZ2R2A01_LAYER4 }


objectset: STATUS_EIZ2R2A01FWCHILDREN_FWSETACTIONS union {STATUS_EIZ2R2A01ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ2R2A01FWCHILDREN_FWSETSTATES union {STATUS_EIZ2R2A01ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER1_PCB1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER1_PCB1 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER1_PCB1_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER1_PCB1_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB1_BOARD1,
	STATUS_EIZ3R1A01_LAYER1_PCB1_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB1_BOARD1,
	STATUS_EIZ3R1A01_LAYER1_PCB1_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER1_PCB1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER1_PCB1FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER1_PCB1ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER1_PCB2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER1_PCB2 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER1_PCB2_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER1_PCB2_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB2_BOARD1,
	STATUS_EIZ3R1A01_LAYER1_PCB2_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB2_BOARD1,
	STATUS_EIZ3R1A01_LAYER1_PCB2_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER1_PCB2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER1_PCB2FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER1_PCB2ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER1_PCB3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER1_PCB3 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD1,
	STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD2,
	STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD3,
	STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD1,
	STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD2,
	STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD3,
	STATUS_EIZ3R1A01_LAYER1_PCB3_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER1_PCB3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER1_PCB3FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER1_PCB3ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER1_PCB4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER1_PCB4 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD1,
	STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD2,
	STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD3,
	STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD1,
	STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD2,
	STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD3,
	STATUS_EIZ3R1A01_LAYER1_PCB4_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER1_PCB4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER1_PCB4FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER1_PCB4ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER1_PCB5TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER1_PCB5 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB5TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD1,
	STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD2,
	STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD3,
	STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD1,
	STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD2,
	STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD3,
	STATUS_EIZ3R1A01_LAYER1_PCB5_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER1_PCB5FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER1_PCB5FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER1_PCB5ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER1 is_of_class STATUS_EIZ3R1A01_LAYER1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB1,
	STATUS_EIZ3R1A01_LAYER1_PCB2,
	STATUS_EIZ3R1A01_LAYER1_PCB3,
	STATUS_EIZ3R1A01_LAYER1_PCB4,
	STATUS_EIZ3R1A01_LAYER1_PCB5 }
objectset: STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER1_PCB1,
	STATUS_EIZ3R1A01_LAYER1_PCB2,
	STATUS_EIZ3R1A01_LAYER1_PCB3,
	STATUS_EIZ3R1A01_LAYER1_PCB4,
	STATUS_EIZ3R1A01_LAYER1_PCB5 }


objectset: STATUS_EIZ3R1A01_LAYER1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER1FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER1ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER2_PCB1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER2_PCB1 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER2_PCB1_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER2_PCB1_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB1_BOARD2,
	STATUS_EIZ3R1A01_LAYER2_PCB1_BOARD3 }
objectset: STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB1_BOARD2,
	STATUS_EIZ3R1A01_LAYER2_PCB1_BOARD3 }


objectset: STATUS_EIZ3R1A01_LAYER2_PCB1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER2_PCB1FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER2_PCB1ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER2_PCB2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER2_PCB2 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER2_PCB2_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER2_PCB2_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB2_BOARD2,
	STATUS_EIZ3R1A01_LAYER2_PCB2_BOARD3 }
objectset: STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB2_BOARD2,
	STATUS_EIZ3R1A01_LAYER2_PCB2_BOARD3 }


objectset: STATUS_EIZ3R1A01_LAYER2_PCB2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER2_PCB2FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER2_PCB2ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER2_PCB3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER2_PCB3 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER2_PCB3_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER2_PCB3_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB3_BOARD2,
	STATUS_EIZ3R1A01_LAYER2_PCB3_BOARD3 }
objectset: STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB3_BOARD2,
	STATUS_EIZ3R1A01_LAYER2_PCB3_BOARD3 }


objectset: STATUS_EIZ3R1A01_LAYER2_PCB3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER2_PCB3FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER2_PCB3ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER2_PCB4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER2_PCB4 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER2_PCB4_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER2_PCB4_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB4_BOARD2,
	STATUS_EIZ3R1A01_LAYER2_PCB4_BOARD3 }
objectset: STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB4_BOARD2,
	STATUS_EIZ3R1A01_LAYER2_PCB4_BOARD3 }


objectset: STATUS_EIZ3R1A01_LAYER2_PCB4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER2_PCB4FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER2_PCB4ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER2_PCB5TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER2_PCB5 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB5TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER2_PCB5_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER2_PCB5_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB5_BOARD2,
	STATUS_EIZ3R1A01_LAYER2_PCB5_BOARD3 }
objectset: STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB5_BOARD2,
	STATUS_EIZ3R1A01_LAYER2_PCB5_BOARD3 }


objectset: STATUS_EIZ3R1A01_LAYER2_PCB5FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER2_PCB5FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER2_PCB5ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER2 is_of_class STATUS_EIZ3R1A01_LAYER2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB1,
	STATUS_EIZ3R1A01_LAYER2_PCB2,
	STATUS_EIZ3R1A01_LAYER2_PCB3,
	STATUS_EIZ3R1A01_LAYER2_PCB4,
	STATUS_EIZ3R1A01_LAYER2_PCB5 }
objectset: STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER2_PCB1,
	STATUS_EIZ3R1A01_LAYER2_PCB2,
	STATUS_EIZ3R1A01_LAYER2_PCB3,
	STATUS_EIZ3R1A01_LAYER2_PCB4,
	STATUS_EIZ3R1A01_LAYER2_PCB5 }


objectset: STATUS_EIZ3R1A01_LAYER2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER2FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER2ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER3_PCB1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER3_PCB1 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER3_PCB1_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER3_PCB1_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB1_BOARD1,
	STATUS_EIZ3R1A01_LAYER3_PCB1_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB1_BOARD1,
	STATUS_EIZ3R1A01_LAYER3_PCB1_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER3_PCB1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER3_PCB1FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER3_PCB1ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER3_PCB2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER3_PCB2 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER3_PCB2_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER3_PCB2_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB2_BOARD1,
	STATUS_EIZ3R1A01_LAYER3_PCB2_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB2_BOARD1,
	STATUS_EIZ3R1A01_LAYER3_PCB2_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER3_PCB2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER3_PCB2FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER3_PCB2ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER3_PCB3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER3_PCB3 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER3_PCB3_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER3_PCB3_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB3_BOARD1,
	STATUS_EIZ3R1A01_LAYER3_PCB3_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB3_BOARD1,
	STATUS_EIZ3R1A01_LAYER3_PCB3_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER3_PCB3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER3_PCB3FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER3_PCB3ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER3_PCB4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER3_PCB4 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER3_PCB4_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER3_PCB4_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB4_BOARD1,
	STATUS_EIZ3R1A01_LAYER3_PCB4_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB4_BOARD1,
	STATUS_EIZ3R1A01_LAYER3_PCB4_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER3_PCB4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER3_PCB4FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER3_PCB4ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER3_PCB5TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER3_PCB5 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB5TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER3_PCB5_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER3_PCB5_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB5_BOARD1,
	STATUS_EIZ3R1A01_LAYER3_PCB5_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB5_BOARD1,
	STATUS_EIZ3R1A01_LAYER3_PCB5_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER3_PCB5FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER3_PCB5FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER3_PCB5ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER3 is_of_class STATUS_EIZ3R1A01_LAYER3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB1,
	STATUS_EIZ3R1A01_LAYER3_PCB2,
	STATUS_EIZ3R1A01_LAYER3_PCB3,
	STATUS_EIZ3R1A01_LAYER3_PCB4,
	STATUS_EIZ3R1A01_LAYER3_PCB5 }
objectset: STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER3_PCB1,
	STATUS_EIZ3R1A01_LAYER3_PCB2,
	STATUS_EIZ3R1A01_LAYER3_PCB3,
	STATUS_EIZ3R1A01_LAYER3_PCB4,
	STATUS_EIZ3R1A01_LAYER3_PCB5 }


objectset: STATUS_EIZ3R1A01_LAYER3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER3FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER3ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER4_PCB1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER4_PCB1 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER4_PCB1_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER4_PCB1_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB1_BOARD2,
	STATUS_EIZ3R1A01_LAYER4_PCB1_BOARD3 }
objectset: STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB1_BOARD2,
	STATUS_EIZ3R1A01_LAYER4_PCB1_BOARD3 }


objectset: STATUS_EIZ3R1A01_LAYER4_PCB1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER4_PCB1FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER4_PCB1ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER4_PCB2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER4_PCB2 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER4_PCB2_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER4_PCB2_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB2_BOARD2,
	STATUS_EIZ3R1A01_LAYER4_PCB2_BOARD3 }
objectset: STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB2_BOARD2,
	STATUS_EIZ3R1A01_LAYER4_PCB2_BOARD3 }


objectset: STATUS_EIZ3R1A01_LAYER4_PCB2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER4_PCB2FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER4_PCB2ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER4_PCB3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER4_PCB3 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD1,
	STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD2,
	STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD3,
	STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD1,
	STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD2,
	STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD3,
	STATUS_EIZ3R1A01_LAYER4_PCB3_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER4_PCB3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER4_PCB3FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER4_PCB3ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER4_PCB4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER4_PCB4 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD1,
	STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD2,
	STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD3,
	STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD1,
	STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD2,
	STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD3,
	STATUS_EIZ3R1A01_LAYER4_PCB4_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER4_PCB4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER4_PCB4FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER4_PCB4ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER4_PCB5TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER4_PCB5 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB5TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD1 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD2 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD3 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD4 is_of_class STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD1,
	STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD2,
	STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD3,
	STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD4 }
objectset: STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD1,
	STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD2,
	STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD3,
	STATUS_EIZ3R1A01_LAYER4_PCB5_BOARD4 }


objectset: STATUS_EIZ3R1A01_LAYER4_PCB5FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER4_PCB5FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER4_PCB5ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01_LAYER4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01_LAYER4 is_of_class STATUS_EIZ3R1A01_LAYER4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWDM is_of_class STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB1,
	STATUS_EIZ3R1A01_LAYER4_PCB2,
	STATUS_EIZ3R1A01_LAYER4_PCB3,
	STATUS_EIZ3R1A01_LAYER4_PCB4,
	STATUS_EIZ3R1A01_LAYER4_PCB5 }
objectset: STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER4_PCB1,
	STATUS_EIZ3R1A01_LAYER4_PCB2,
	STATUS_EIZ3R1A01_LAYER4_PCB3,
	STATUS_EIZ3R1A01_LAYER4_PCB4,
	STATUS_EIZ3R1A01_LAYER4_PCB5 }


objectset: STATUS_EIZ3R1A01_LAYER4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01_LAYER4FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01_LAYER4ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R1A01TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R1A01ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R1A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R1A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R1A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R1A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R1A01 is_of_class STATUS_EIZ3R1A01TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R1A01ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R1A01ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R1A01ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R1A01ATLAS_STATUS_FWDM is_of_class STATUS_EIZ3R1A01ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R1A01_LAYER1,
	STATUS_EIZ3R1A01_LAYER2,
	STATUS_EIZ3R1A01_LAYER3,
	STATUS_EIZ3R1A01_LAYER4 }
objectset: STATUS_EIZ3R1A01ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R1A01_LAYER1,
	STATUS_EIZ3R1A01_LAYER2,
	STATUS_EIZ3R1A01_LAYER3,
	STATUS_EIZ3R1A01_LAYER4 }


objectset: STATUS_EIZ3R1A01FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R1A01ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R1A01FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R1A01ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER1_PCB6TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER1_PCB6 is_of_class STATUS_EIZ3R2A01_LAYER1_PCB6TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD1 is_of_class STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD2 is_of_class STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD3 is_of_class STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD4 is_of_class STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD1,
	STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD2,
	STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD3,
	STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD4 }
objectset: STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD1,
	STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD2,
	STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD3,
	STATUS_EIZ3R2A01_LAYER1_PCB6_BOARD4 }


objectset: STATUS_EIZ3R2A01_LAYER1_PCB6FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER1_PCB6FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER1_PCB6ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER1_PCB7TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER1_PCB7 is_of_class STATUS_EIZ3R2A01_LAYER1_PCB7TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER1_PCB7_BOARD1 is_of_class STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER1_PCB7_BOARD4 is_of_class STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER1_PCB7_BOARD1,
	STATUS_EIZ3R2A01_LAYER1_PCB7_BOARD4 }
objectset: STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER1_PCB7_BOARD1,
	STATUS_EIZ3R2A01_LAYER1_PCB7_BOARD4 }


objectset: STATUS_EIZ3R2A01_LAYER1_PCB7FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER1_PCB7FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER1_PCB7ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER1_PCB8TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER1_PCB8 is_of_class STATUS_EIZ3R2A01_LAYER1_PCB8TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER1_PCB8_BOARD1 is_of_class STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER1_PCB8_BOARD4 is_of_class STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER1_PCB8_BOARD1,
	STATUS_EIZ3R2A01_LAYER1_PCB8_BOARD4 }
objectset: STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER1_PCB8_BOARD1,
	STATUS_EIZ3R2A01_LAYER1_PCB8_BOARD4 }


objectset: STATUS_EIZ3R2A01_LAYER1_PCB8FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER1_PCB8FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER1_PCB8ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER1TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER1 is_of_class STATUS_EIZ3R2A01_LAYER1TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER1_PCB6,
	STATUS_EIZ3R2A01_LAYER1_PCB7,
	STATUS_EIZ3R2A01_LAYER1_PCB8 }
objectset: STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER1_PCB6,
	STATUS_EIZ3R2A01_LAYER1_PCB7,
	STATUS_EIZ3R2A01_LAYER1_PCB8 }


objectset: STATUS_EIZ3R2A01_LAYER1FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER1FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER1ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER2_PCB6TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER2_PCB6 is_of_class STATUS_EIZ3R2A01_LAYER2_PCB6TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER2_PCB6_BOARD2 is_of_class STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER2_PCB6_BOARD3 is_of_class STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER2_PCB6_BOARD2,
	STATUS_EIZ3R2A01_LAYER2_PCB6_BOARD3 }
objectset: STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER2_PCB6_BOARD2,
	STATUS_EIZ3R2A01_LAYER2_PCB6_BOARD3 }


objectset: STATUS_EIZ3R2A01_LAYER2_PCB6FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER2_PCB6FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER2_PCB6ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER2_PCB7TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER2_PCB7 is_of_class STATUS_EIZ3R2A01_LAYER2_PCB7TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER2_PCB7_BOARD2 is_of_class STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER2_PCB7_BOARD3 is_of_class STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER2_PCB7_BOARD2,
	STATUS_EIZ3R2A01_LAYER2_PCB7_BOARD3 }
objectset: STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER2_PCB7_BOARD2,
	STATUS_EIZ3R2A01_LAYER2_PCB7_BOARD3 }


objectset: STATUS_EIZ3R2A01_LAYER2_PCB7FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER2_PCB7FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER2_PCB7ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER2_PCB8TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER2_PCB8 is_of_class STATUS_EIZ3R2A01_LAYER2_PCB8TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER2_PCB8_BOARD2 is_of_class STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER2_PCB8_BOARD3 is_of_class STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER2_PCB8_BOARD2,
	STATUS_EIZ3R2A01_LAYER2_PCB8_BOARD3 }
objectset: STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER2_PCB8_BOARD2,
	STATUS_EIZ3R2A01_LAYER2_PCB8_BOARD3 }


objectset: STATUS_EIZ3R2A01_LAYER2_PCB8FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER2_PCB8FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER2_PCB8ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER2TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER2 is_of_class STATUS_EIZ3R2A01_LAYER2TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER2_PCB6,
	STATUS_EIZ3R2A01_LAYER2_PCB7,
	STATUS_EIZ3R2A01_LAYER2_PCB8 }
objectset: STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER2_PCB6,
	STATUS_EIZ3R2A01_LAYER2_PCB7,
	STATUS_EIZ3R2A01_LAYER2_PCB8 }


objectset: STATUS_EIZ3R2A01_LAYER2FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER2FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER2ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER3_PCB6TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER3_PCB6 is_of_class STATUS_EIZ3R2A01_LAYER3_PCB6TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER3_PCB6_BOARD1 is_of_class STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER3_PCB6_BOARD4 is_of_class STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER3_PCB6_BOARD1,
	STATUS_EIZ3R2A01_LAYER3_PCB6_BOARD4 }
objectset: STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER3_PCB6_BOARD1,
	STATUS_EIZ3R2A01_LAYER3_PCB6_BOARD4 }


objectset: STATUS_EIZ3R2A01_LAYER3_PCB6FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER3_PCB6FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER3_PCB6ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER3_PCB7TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER3_PCB7 is_of_class STATUS_EIZ3R2A01_LAYER3_PCB7TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER3_PCB7_BOARD1 is_of_class STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER3_PCB7_BOARD4 is_of_class STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER3_PCB7_BOARD1,
	STATUS_EIZ3R2A01_LAYER3_PCB7_BOARD4 }
objectset: STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER3_PCB7_BOARD1,
	STATUS_EIZ3R2A01_LAYER3_PCB7_BOARD4 }


objectset: STATUS_EIZ3R2A01_LAYER3_PCB7FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER3_PCB7FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER3_PCB7ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER3_PCB8TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER3_PCB8 is_of_class STATUS_EIZ3R2A01_LAYER3_PCB8TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER3_PCB8_BOARD1 is_of_class STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER3_PCB8_BOARD4 is_of_class STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER3_PCB8_BOARD1,
	STATUS_EIZ3R2A01_LAYER3_PCB8_BOARD4 }
objectset: STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER3_PCB8_BOARD1,
	STATUS_EIZ3R2A01_LAYER3_PCB8_BOARD4 }


objectset: STATUS_EIZ3R2A01_LAYER3_PCB8FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER3_PCB8FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER3_PCB8ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER3TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER3 is_of_class STATUS_EIZ3R2A01_LAYER3TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER3_PCB6,
	STATUS_EIZ3R2A01_LAYER3_PCB7,
	STATUS_EIZ3R2A01_LAYER3_PCB8 }
objectset: STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER3_PCB6,
	STATUS_EIZ3R2A01_LAYER3_PCB7,
	STATUS_EIZ3R2A01_LAYER3_PCB8 }


objectset: STATUS_EIZ3R2A01_LAYER3FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER3FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER3ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER4_PCB6TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER4_PCB6 is_of_class STATUS_EIZ3R2A01_LAYER4_PCB6TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD1 is_of_class STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD2 is_of_class STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD3 is_of_class STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD4 is_of_class STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD1,
	STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD2,
	STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD3,
	STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD4 }
objectset: STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD1,
	STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD2,
	STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD3,
	STATUS_EIZ3R2A01_LAYER4_PCB6_BOARD4 }


objectset: STATUS_EIZ3R2A01_LAYER4_PCB6FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER4_PCB6FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER4_PCB6ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER4_PCB7TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER4_PCB7 is_of_class STATUS_EIZ3R2A01_LAYER4_PCB7TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER4_PCB7_BOARD2 is_of_class STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER4_PCB7_BOARD3 is_of_class STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER4_PCB7_BOARD2,
	STATUS_EIZ3R2A01_LAYER4_PCB7_BOARD3 }
objectset: STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER4_PCB7_BOARD2,
	STATUS_EIZ3R2A01_LAYER4_PCB7_BOARD3 }


objectset: STATUS_EIZ3R2A01_LAYER4_PCB7FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER4_PCB7FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER4_PCB7ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER4_PCB8TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER4_PCB8 is_of_class STATUS_EIZ3R2A01_LAYER4_PCB8TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FwDevMode_CLASS


class: STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_CLASS
!panel: ATLAS_DU_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
    state: OK	!color: FwStateOKPhysics
        action: GOTO_WARNING	!visible: 0
            move_to WARNING
        action: GOTO_ERROR	!visible: 0
            move_to ERROR
        action: GOTO_FATAL	!visible: 0
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 0
            move_to UNINITIALIZED
    state: WARNING	!color: FwStateAttention1
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: ERROR	!color: FwStateAttention2
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_FATAL	!visible: 1
            move_to FATAL
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED
    state: FATAL	!color: FwStateAttention3
        action: GOTO_OK	!visible: 1
            move_to OK
        action: GOTO_WARNING	!visible: 1
            move_to WARNING
        action: GOTO_ERROR	!visible: 1
            move_to ERROR
        action: GOTO_UNINITIALIZED	!visible: 1
            move_to UNINITIALIZED

object: STATUS_EIZ3R2A01_LAYER4_PCB8_BOARD2 is_of_class STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_CLASS

object: STATUS_EIZ3R2A01_LAYER4_PCB8_BOARD3 is_of_class STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_CLASS

objectset: STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER4_PCB8_BOARD2,
	STATUS_EIZ3R2A01_LAYER4_PCB8_BOARD3 }
objectset: STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER4_PCB8_BOARD2,
	STATUS_EIZ3R2A01_LAYER4_PCB8_BOARD3 }


objectset: STATUS_EIZ3R2A01_LAYER4_PCB8FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER4_PCB8FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER4_PCB8ATLAS_DU_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01_LAYER4TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01_LAYER4 is_of_class STATUS_EIZ3R2A01_LAYER4TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWDM is_of_class STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER4_PCB6,
	STATUS_EIZ3R2A01_LAYER4_PCB7,
	STATUS_EIZ3R2A01_LAYER4_PCB8 }
objectset: STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER4_PCB6,
	STATUS_EIZ3R2A01_LAYER4_PCB7,
	STATUS_EIZ3R2A01_LAYER4_PCB8 }


objectset: STATUS_EIZ3R2A01_LAYER4FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01_LAYER4FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01_LAYER4ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_EIZ3R2A01TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_EIZ3R2A01ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_EIZ3R2A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_EIZ3R2A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_EIZ3R2A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_EIZ3R2A01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_EIZ3R2A01 is_of_class STATUS_EIZ3R2A01TOP_ATLAS_STATUS_CLASS

class: STATUS_EIZ3R2A01ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_EIZ3R2A01ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_EIZ3R2A01ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_EIZ3R2A01ATLAS_STATUS_FWDM is_of_class STATUS_EIZ3R2A01ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ3R2A01_LAYER1,
	STATUS_EIZ3R2A01_LAYER2,
	STATUS_EIZ3R2A01_LAYER3,
	STATUS_EIZ3R2A01_LAYER4 }
objectset: STATUS_EIZ3R2A01ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ3R2A01_LAYER1,
	STATUS_EIZ3R2A01_LAYER2,
	STATUS_EIZ3R2A01_LAYER3,
	STATUS_EIZ3R2A01_LAYER4 }


objectset: STATUS_EIZ3R2A01FWCHILDREN_FWSETACTIONS union {STATUS_EIZ3R2A01ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_EIZ3R2A01FWCHILDREN_FWSETSTATES union {STATUS_EIZ3R2A01ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: STATUS_MMG_SIDE_A_SECTOR_01TOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_MMG_SIDE_A_SECTOR_01 is_of_class STATUS_MMG_SIDE_A_SECTOR_01TOP_ATLAS_STATUS_CLASS

class: STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWDM is_of_class STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FwDevMode_CLASS


objectset: STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_EIZ2R1A01,
	STATUS_EIZ2R2A01,
	STATUS_EIZ3R1A01,
	STATUS_EIZ3R2A01 }
objectset: STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_EIZ2R1A01,
	STATUS_EIZ2R2A01,
	STATUS_EIZ3R1A01,
	STATUS_EIZ3R2A01 }


objectset: STATUS_MMG_SIDE_A_SECTOR_01FWCHILDREN_FWSETACTIONS union {STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_MMG_SIDE_A_SECTOR_01FWCHILDREN_FWSETSTATES union {STATUS_MMG_SIDE_A_SECTOR_01ATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER1_PCB1TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER1_PCB1 is_of_class EIZ2R1A01_LAYER1_PCB1TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER1_PCB1MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER1_PCB1MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER1_PCB1MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER1_PCB1MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER1_PCB1_BOARD1 is_of_class EIZ2R1A01_LAYER1_PCB1MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER1_PCB1_BOARD4 is_of_class EIZ2R1A01_LAYER1_PCB1MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER1_PCB1_BOARD1,
	EIZ2R1A01_LAYER1_PCB1_BOARD4 }
objectset: EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER1_PCB1_BOARD1,
	EIZ2R1A01_LAYER1_PCB1_BOARD4 }


objectset: EIZ2R1A01_LAYER1_PCB1FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER1_PCB1FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER1_PCB2TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER1_PCB2 is_of_class EIZ2R1A01_LAYER1_PCB2TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER1_PCB2MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER1_PCB2MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER1_PCB2MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER1_PCB2MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER1_PCB2_BOARD1 is_of_class EIZ2R1A01_LAYER1_PCB2MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER1_PCB2_BOARD4 is_of_class EIZ2R1A01_LAYER1_PCB2MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER1_PCB2_BOARD1,
	EIZ2R1A01_LAYER1_PCB2_BOARD4 }
objectset: EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER1_PCB2_BOARD1,
	EIZ2R1A01_LAYER1_PCB2_BOARD4 }


objectset: EIZ2R1A01_LAYER1_PCB2FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER1_PCB2FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER1_PCB3TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER1_PCB3 is_of_class EIZ2R1A01_LAYER1_PCB3TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER1_PCB3MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER1_PCB3MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER1_PCB3MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER1_PCB3MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER1_PCB3_BOARD1 is_of_class EIZ2R1A01_LAYER1_PCB3MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER1_PCB3_BOARD2 is_of_class EIZ2R1A01_LAYER1_PCB3MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER1_PCB3_BOARD3 is_of_class EIZ2R1A01_LAYER1_PCB3MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER1_PCB3_BOARD4 is_of_class EIZ2R1A01_LAYER1_PCB3MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER1_PCB3_BOARD1,
	EIZ2R1A01_LAYER1_PCB3_BOARD2,
	EIZ2R1A01_LAYER1_PCB3_BOARD3,
	EIZ2R1A01_LAYER1_PCB3_BOARD4 }
objectset: EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER1_PCB3_BOARD1,
	EIZ2R1A01_LAYER1_PCB3_BOARD2,
	EIZ2R1A01_LAYER1_PCB3_BOARD3,
	EIZ2R1A01_LAYER1_PCB3_BOARD4 }


objectset: EIZ2R1A01_LAYER1_PCB3FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER1_PCB3FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER1_PCB4TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER1_PCB4 is_of_class EIZ2R1A01_LAYER1_PCB4TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER1_PCB4MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER1_PCB4MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER1_PCB4MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER1_PCB4MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER1_PCB4_BOARD1 is_of_class EIZ2R1A01_LAYER1_PCB4MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER1_PCB4_BOARD2 is_of_class EIZ2R1A01_LAYER1_PCB4MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER1_PCB4_BOARD3 is_of_class EIZ2R1A01_LAYER1_PCB4MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER1_PCB4_BOARD4 is_of_class EIZ2R1A01_LAYER1_PCB4MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER1_PCB4_BOARD1,
	EIZ2R1A01_LAYER1_PCB4_BOARD2,
	EIZ2R1A01_LAYER1_PCB4_BOARD3,
	EIZ2R1A01_LAYER1_PCB4_BOARD4 }
objectset: EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER1_PCB4_BOARD1,
	EIZ2R1A01_LAYER1_PCB4_BOARD2,
	EIZ2R1A01_LAYER1_PCB4_BOARD3,
	EIZ2R1A01_LAYER1_PCB4_BOARD4 }


objectset: EIZ2R1A01_LAYER1_PCB4FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER1_PCB4FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER1_PCB5TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER1_PCB5 is_of_class EIZ2R1A01_LAYER1_PCB5TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER1_PCB5MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER1_PCB5MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER1_PCB5MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER1_PCB5MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER1_PCB5_BOARD1 is_of_class EIZ2R1A01_LAYER1_PCB5MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER1_PCB5_BOARD2 is_of_class EIZ2R1A01_LAYER1_PCB5MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER1_PCB5_BOARD3 is_of_class EIZ2R1A01_LAYER1_PCB5MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER1_PCB5_BOARD4 is_of_class EIZ2R1A01_LAYER1_PCB5MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER1_PCB5_BOARD1,
	EIZ2R1A01_LAYER1_PCB5_BOARD2,
	EIZ2R1A01_LAYER1_PCB5_BOARD3,
	EIZ2R1A01_LAYER1_PCB5_BOARD4 }
objectset: EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER1_PCB5_BOARD1,
	EIZ2R1A01_LAYER1_PCB5_BOARD2,
	EIZ2R1A01_LAYER1_PCB5_BOARD3,
	EIZ2R1A01_LAYER1_PCB5_BOARD4 }


objectset: EIZ2R1A01_LAYER1_PCB5FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER1_PCB5FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER1TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER1 is_of_class EIZ2R1A01_LAYER1TOP_MMG_ELTX_Layer_CLASS

class: EIZ2R1A01_LAYER1MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER1MMG_ELTX_Pcb_FWDM is_of_class EIZ2R1A01_LAYER1MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER1_PCB1,
	EIZ2R1A01_LAYER1_PCB2,
	EIZ2R1A01_LAYER1_PCB3,
	EIZ2R1A01_LAYER1_PCB4,
	EIZ2R1A01_LAYER1_PCB5 }
objectset: EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER1_PCB1,
	EIZ2R1A01_LAYER1_PCB2,
	EIZ2R1A01_LAYER1_PCB3,
	EIZ2R1A01_LAYER1_PCB4,
	EIZ2R1A01_LAYER1_PCB5 }


objectset: EIZ2R1A01_LAYER1FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER1FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER2_PCB1TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER2_PCB1 is_of_class EIZ2R1A01_LAYER2_PCB1TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER2_PCB1MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER2_PCB1MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER2_PCB1MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER2_PCB1MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER2_PCB1_BOARD2 is_of_class EIZ2R1A01_LAYER2_PCB1MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER2_PCB1_BOARD3 is_of_class EIZ2R1A01_LAYER2_PCB1MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER2_PCB1_BOARD2,
	EIZ2R1A01_LAYER2_PCB1_BOARD3 }
objectset: EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER2_PCB1_BOARD2,
	EIZ2R1A01_LAYER2_PCB1_BOARD3 }


objectset: EIZ2R1A01_LAYER2_PCB1FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER2_PCB1FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER2_PCB2TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER2_PCB2 is_of_class EIZ2R1A01_LAYER2_PCB2TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER2_PCB2MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER2_PCB2MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER2_PCB2MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER2_PCB2MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER2_PCB2_BOARD2 is_of_class EIZ2R1A01_LAYER2_PCB2MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER2_PCB2_BOARD3 is_of_class EIZ2R1A01_LAYER2_PCB2MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER2_PCB2_BOARD2,
	EIZ2R1A01_LAYER2_PCB2_BOARD3 }
objectset: EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER2_PCB2_BOARD2,
	EIZ2R1A01_LAYER2_PCB2_BOARD3 }


objectset: EIZ2R1A01_LAYER2_PCB2FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER2_PCB2FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER2_PCB3TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER2_PCB3 is_of_class EIZ2R1A01_LAYER2_PCB3TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER2_PCB3MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER2_PCB3MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER2_PCB3MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER2_PCB3MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER2_PCB3_BOARD2 is_of_class EIZ2R1A01_LAYER2_PCB3MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER2_PCB3_BOARD3 is_of_class EIZ2R1A01_LAYER2_PCB3MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER2_PCB3_BOARD2,
	EIZ2R1A01_LAYER2_PCB3_BOARD3 }
objectset: EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER2_PCB3_BOARD2,
	EIZ2R1A01_LAYER2_PCB3_BOARD3 }


objectset: EIZ2R1A01_LAYER2_PCB3FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER2_PCB3FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER2_PCB4TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER2_PCB4 is_of_class EIZ2R1A01_LAYER2_PCB4TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER2_PCB4MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER2_PCB4MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER2_PCB4MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER2_PCB4MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER2_PCB4_BOARD2 is_of_class EIZ2R1A01_LAYER2_PCB4MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER2_PCB4_BOARD3 is_of_class EIZ2R1A01_LAYER2_PCB4MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER2_PCB4_BOARD2,
	EIZ2R1A01_LAYER2_PCB4_BOARD3 }
objectset: EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER2_PCB4_BOARD2,
	EIZ2R1A01_LAYER2_PCB4_BOARD3 }


objectset: EIZ2R1A01_LAYER2_PCB4FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER2_PCB4FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER2_PCB5TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER2_PCB5 is_of_class EIZ2R1A01_LAYER2_PCB5TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER2_PCB5MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER2_PCB5MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER2_PCB5MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER2_PCB5MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER2_PCB5_BOARD2 is_of_class EIZ2R1A01_LAYER2_PCB5MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER2_PCB5_BOARD3 is_of_class EIZ2R1A01_LAYER2_PCB5MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER2_PCB5_BOARD2,
	EIZ2R1A01_LAYER2_PCB5_BOARD3 }
objectset: EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER2_PCB5_BOARD2,
	EIZ2R1A01_LAYER2_PCB5_BOARD3 }


objectset: EIZ2R1A01_LAYER2_PCB5FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER2_PCB5FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER2TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER2 is_of_class EIZ2R1A01_LAYER2TOP_MMG_ELTX_Layer_CLASS

class: EIZ2R1A01_LAYER2MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER2MMG_ELTX_Pcb_FWDM is_of_class EIZ2R1A01_LAYER2MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER2_PCB1,
	EIZ2R1A01_LAYER2_PCB2,
	EIZ2R1A01_LAYER2_PCB3,
	EIZ2R1A01_LAYER2_PCB4,
	EIZ2R1A01_LAYER2_PCB5 }
objectset: EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER2_PCB1,
	EIZ2R1A01_LAYER2_PCB2,
	EIZ2R1A01_LAYER2_PCB3,
	EIZ2R1A01_LAYER2_PCB4,
	EIZ2R1A01_LAYER2_PCB5 }


objectset: EIZ2R1A01_LAYER2FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER2FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER3_PCB1TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER3_PCB1 is_of_class EIZ2R1A01_LAYER3_PCB1TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER3_PCB1MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER3_PCB1MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER3_PCB1MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER3_PCB1MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER3_PCB1_BOARD1 is_of_class EIZ2R1A01_LAYER3_PCB1MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER3_PCB1_BOARD4 is_of_class EIZ2R1A01_LAYER3_PCB1MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER3_PCB1_BOARD1,
	EIZ2R1A01_LAYER3_PCB1_BOARD4 }
objectset: EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER3_PCB1_BOARD1,
	EIZ2R1A01_LAYER3_PCB1_BOARD4 }


objectset: EIZ2R1A01_LAYER3_PCB1FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER3_PCB1FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER3_PCB2TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER3_PCB2 is_of_class EIZ2R1A01_LAYER3_PCB2TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER3_PCB2MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER3_PCB2MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER3_PCB2MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER3_PCB2MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER3_PCB2_BOARD1 is_of_class EIZ2R1A01_LAYER3_PCB2MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER3_PCB2_BOARD4 is_of_class EIZ2R1A01_LAYER3_PCB2MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER3_PCB2_BOARD1,
	EIZ2R1A01_LAYER3_PCB2_BOARD4 }
objectset: EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER3_PCB2_BOARD1,
	EIZ2R1A01_LAYER3_PCB2_BOARD4 }


objectset: EIZ2R1A01_LAYER3_PCB2FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER3_PCB2FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER3_PCB3TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER3_PCB3 is_of_class EIZ2R1A01_LAYER3_PCB3TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER3_PCB3MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER3_PCB3MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER3_PCB3MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER3_PCB3MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER3_PCB3_BOARD1 is_of_class EIZ2R1A01_LAYER3_PCB3MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER3_PCB3_BOARD4 is_of_class EIZ2R1A01_LAYER3_PCB3MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER3_PCB3_BOARD1,
	EIZ2R1A01_LAYER3_PCB3_BOARD4 }
objectset: EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER3_PCB3_BOARD1,
	EIZ2R1A01_LAYER3_PCB3_BOARD4 }


objectset: EIZ2R1A01_LAYER3_PCB3FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER3_PCB3FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER3_PCB4TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER3_PCB4 is_of_class EIZ2R1A01_LAYER3_PCB4TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER3_PCB4MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER3_PCB4MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER3_PCB4MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER3_PCB4MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER3_PCB4_BOARD1 is_of_class EIZ2R1A01_LAYER3_PCB4MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER3_PCB4_BOARD4 is_of_class EIZ2R1A01_LAYER3_PCB4MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER3_PCB4_BOARD1,
	EIZ2R1A01_LAYER3_PCB4_BOARD4 }
objectset: EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER3_PCB4_BOARD1,
	EIZ2R1A01_LAYER3_PCB4_BOARD4 }


objectset: EIZ2R1A01_LAYER3_PCB4FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER3_PCB4FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER3_PCB5TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER3_PCB5 is_of_class EIZ2R1A01_LAYER3_PCB5TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER3_PCB5MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER3_PCB5MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER3_PCB5MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER3_PCB5MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER3_PCB5_BOARD1 is_of_class EIZ2R1A01_LAYER3_PCB5MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER3_PCB5_BOARD4 is_of_class EIZ2R1A01_LAYER3_PCB5MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER3_PCB5_BOARD1,
	EIZ2R1A01_LAYER3_PCB5_BOARD4 }
objectset: EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER3_PCB5_BOARD1,
	EIZ2R1A01_LAYER3_PCB5_BOARD4 }


objectset: EIZ2R1A01_LAYER3_PCB5FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER3_PCB5FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER3TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER3 is_of_class EIZ2R1A01_LAYER3TOP_MMG_ELTX_Layer_CLASS

class: EIZ2R1A01_LAYER3MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER3MMG_ELTX_Pcb_FWDM is_of_class EIZ2R1A01_LAYER3MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER3_PCB1,
	EIZ2R1A01_LAYER3_PCB2,
	EIZ2R1A01_LAYER3_PCB3,
	EIZ2R1A01_LAYER3_PCB4,
	EIZ2R1A01_LAYER3_PCB5 }
objectset: EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER3_PCB1,
	EIZ2R1A01_LAYER3_PCB2,
	EIZ2R1A01_LAYER3_PCB3,
	EIZ2R1A01_LAYER3_PCB4,
	EIZ2R1A01_LAYER3_PCB5 }


objectset: EIZ2R1A01_LAYER3FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER3FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER4_PCB1TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER4_PCB1 is_of_class EIZ2R1A01_LAYER4_PCB1TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER4_PCB1MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER4_PCB1MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER4_PCB1MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER4_PCB1MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER4_PCB1_BOARD2 is_of_class EIZ2R1A01_LAYER4_PCB1MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER4_PCB1_BOARD3 is_of_class EIZ2R1A01_LAYER4_PCB1MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER4_PCB1_BOARD2,
	EIZ2R1A01_LAYER4_PCB1_BOARD3 }
objectset: EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER4_PCB1_BOARD2,
	EIZ2R1A01_LAYER4_PCB1_BOARD3 }


objectset: EIZ2R1A01_LAYER4_PCB1FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER4_PCB1FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER4_PCB2TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER4_PCB2 is_of_class EIZ2R1A01_LAYER4_PCB2TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER4_PCB2MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER4_PCB2MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER4_PCB2MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER4_PCB2MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER4_PCB2_BOARD2 is_of_class EIZ2R1A01_LAYER4_PCB2MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER4_PCB2_BOARD3 is_of_class EIZ2R1A01_LAYER4_PCB2MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER4_PCB2_BOARD2,
	EIZ2R1A01_LAYER4_PCB2_BOARD3 }
objectset: EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER4_PCB2_BOARD2,
	EIZ2R1A01_LAYER4_PCB2_BOARD3 }


objectset: EIZ2R1A01_LAYER4_PCB2FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER4_PCB2FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER4_PCB3TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER4_PCB3 is_of_class EIZ2R1A01_LAYER4_PCB3TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER4_PCB3MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER4_PCB3MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER4_PCB3MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER4_PCB3MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER4_PCB3_BOARD1 is_of_class EIZ2R1A01_LAYER4_PCB3MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER4_PCB3_BOARD2 is_of_class EIZ2R1A01_LAYER4_PCB3MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER4_PCB3_BOARD3 is_of_class EIZ2R1A01_LAYER4_PCB3MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER4_PCB3_BOARD4 is_of_class EIZ2R1A01_LAYER4_PCB3MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER4_PCB3_BOARD1,
	EIZ2R1A01_LAYER4_PCB3_BOARD2,
	EIZ2R1A01_LAYER4_PCB3_BOARD3,
	EIZ2R1A01_LAYER4_PCB3_BOARD4 }
objectset: EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER4_PCB3_BOARD1,
	EIZ2R1A01_LAYER4_PCB3_BOARD2,
	EIZ2R1A01_LAYER4_PCB3_BOARD3,
	EIZ2R1A01_LAYER4_PCB3_BOARD4 }


objectset: EIZ2R1A01_LAYER4_PCB3FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER4_PCB3FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER4_PCB4TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER4_PCB4 is_of_class EIZ2R1A01_LAYER4_PCB4TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER4_PCB4MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER4_PCB4MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER4_PCB4MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER4_PCB4MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER4_PCB4_BOARD1 is_of_class EIZ2R1A01_LAYER4_PCB4MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER4_PCB4_BOARD2 is_of_class EIZ2R1A01_LAYER4_PCB4MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER4_PCB4_BOARD3 is_of_class EIZ2R1A01_LAYER4_PCB4MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER4_PCB4_BOARD4 is_of_class EIZ2R1A01_LAYER4_PCB4MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER4_PCB4_BOARD1,
	EIZ2R1A01_LAYER4_PCB4_BOARD2,
	EIZ2R1A01_LAYER4_PCB4_BOARD3,
	EIZ2R1A01_LAYER4_PCB4_BOARD4 }
objectset: EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER4_PCB4_BOARD1,
	EIZ2R1A01_LAYER4_PCB4_BOARD2,
	EIZ2R1A01_LAYER4_PCB4_BOARD3,
	EIZ2R1A01_LAYER4_PCB4_BOARD4 }


objectset: EIZ2R1A01_LAYER4_PCB4FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER4_PCB4FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER4_PCB5TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER4_PCB5 is_of_class EIZ2R1A01_LAYER4_PCB5TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R1A01_LAYER4_PCB5MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER4_PCB5MMG_ELTX_Board_FWDM is_of_class EIZ2R1A01_LAYER4_PCB5MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R1A01_LAYER4_PCB5MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R1A01_LAYER4_PCB5_BOARD1 is_of_class EIZ2R1A01_LAYER4_PCB5MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER4_PCB5_BOARD2 is_of_class EIZ2R1A01_LAYER4_PCB5MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER4_PCB5_BOARD3 is_of_class EIZ2R1A01_LAYER4_PCB5MMG_ELTX_Board_CLASS

object: EIZ2R1A01_LAYER4_PCB5_BOARD4 is_of_class EIZ2R1A01_LAYER4_PCB5MMG_ELTX_Board_CLASS

objectset: EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER4_PCB5_BOARD1,
	EIZ2R1A01_LAYER4_PCB5_BOARD2,
	EIZ2R1A01_LAYER4_PCB5_BOARD3,
	EIZ2R1A01_LAYER4_PCB5_BOARD4 }
objectset: EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER4_PCB5_BOARD1,
	EIZ2R1A01_LAYER4_PCB5_BOARD2,
	EIZ2R1A01_LAYER4_PCB5_BOARD3,
	EIZ2R1A01_LAYER4_PCB5_BOARD4 }


objectset: EIZ2R1A01_LAYER4_PCB5FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER4_PCB5FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01_LAYER4TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01_LAYER4 is_of_class EIZ2R1A01_LAYER4TOP_MMG_ELTX_Layer_CLASS

class: EIZ2R1A01_LAYER4MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ2R1A01_LAYER4MMG_ELTX_Pcb_FWDM is_of_class EIZ2R1A01_LAYER4MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER4_PCB1,
	EIZ2R1A01_LAYER4_PCB2,
	EIZ2R1A01_LAYER4_PCB3,
	EIZ2R1A01_LAYER4_PCB4,
	EIZ2R1A01_LAYER4_PCB5 }
objectset: EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER4_PCB1,
	EIZ2R1A01_LAYER4_PCB2,
	EIZ2R1A01_LAYER4_PCB3,
	EIZ2R1A01_LAYER4_PCB4,
	EIZ2R1A01_LAYER4_PCB5 }


objectset: EIZ2R1A01_LAYER4FWCHILDREN_FWSETACTIONS union {EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01_LAYER4FWCHILDREN_FWSETSTATES union {EIZ2R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ2R1A01TOP_MMG_ELTX_CHAMBER_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_CHAMBER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R1A01MMG_ELTX_LAYER_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R1A01MMG_ELTX_LAYER_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R1A01MMG_ELTX_LAYER_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R1A01MMG_ELTX_LAYER_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R1A01MMG_ELTX_LAYER_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R1A01 is_of_class EIZ2R1A01TOP_MMG_ELTX_CHAMBER_CLASS

class: EIZ2R1A01MMG_ELTX_Layer_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R1A01MMG_ELTX_LAYER_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R1A01MMG_ELTX_LAYER_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R1A01MMG_ELTX_LAYER_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R1A01MMG_ELTX_LAYER_FWSETACTIONS
            move_to READY

object: EIZ2R1A01MMG_ELTX_Layer_FWDM is_of_class EIZ2R1A01MMG_ELTX_Layer_FwDevMode_CLASS


objectset: EIZ2R1A01MMG_ELTX_LAYER_FWSETSTATES is_of_class VOID {EIZ2R1A01_LAYER1,
	EIZ2R1A01_LAYER2,
	EIZ2R1A01_LAYER3,
	EIZ2R1A01_LAYER4 }
objectset: EIZ2R1A01MMG_ELTX_LAYER_FWSETACTIONS is_of_class VOID {EIZ2R1A01_LAYER1,
	EIZ2R1A01_LAYER2,
	EIZ2R1A01_LAYER3,
	EIZ2R1A01_LAYER4 }


objectset: EIZ2R1A01FWCHILDREN_FWSETACTIONS union {EIZ2R1A01MMG_ELTX_LAYER_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R1A01FWCHILDREN_FWSETSTATES union {EIZ2R1A01MMG_ELTX_LAYER_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER1_PCB6TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER1_PCB6 is_of_class EIZ2R2A01_LAYER1_PCB6TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER1_PCB6MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER1_PCB6MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER1_PCB6MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER1_PCB6MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER1_PCB6_BOARD1 is_of_class EIZ2R2A01_LAYER1_PCB6MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER1_PCB6_BOARD2 is_of_class EIZ2R2A01_LAYER1_PCB6MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER1_PCB6_BOARD3 is_of_class EIZ2R2A01_LAYER1_PCB6MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER1_PCB6_BOARD4 is_of_class EIZ2R2A01_LAYER1_PCB6MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER1_PCB6_BOARD1,
	EIZ2R2A01_LAYER1_PCB6_BOARD2,
	EIZ2R2A01_LAYER1_PCB6_BOARD3,
	EIZ2R2A01_LAYER1_PCB6_BOARD4 }
objectset: EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER1_PCB6_BOARD1,
	EIZ2R2A01_LAYER1_PCB6_BOARD2,
	EIZ2R2A01_LAYER1_PCB6_BOARD3,
	EIZ2R2A01_LAYER1_PCB6_BOARD4 }


objectset: EIZ2R2A01_LAYER1_PCB6FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER1_PCB6FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER1_PCB7TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER1_PCB7 is_of_class EIZ2R2A01_LAYER1_PCB7TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER1_PCB7MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER1_PCB7MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER1_PCB7MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER1_PCB7MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER1_PCB7_BOARD1 is_of_class EIZ2R2A01_LAYER1_PCB7MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER1_PCB7_BOARD4 is_of_class EIZ2R2A01_LAYER1_PCB7MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER1_PCB7_BOARD1,
	EIZ2R2A01_LAYER1_PCB7_BOARD4 }
objectset: EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER1_PCB7_BOARD1,
	EIZ2R2A01_LAYER1_PCB7_BOARD4 }


objectset: EIZ2R2A01_LAYER1_PCB7FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER1_PCB7FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER1_PCB8TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER1_PCB8 is_of_class EIZ2R2A01_LAYER1_PCB8TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER1_PCB8MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER1_PCB8MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER1_PCB8MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER1_PCB8MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER1_PCB8_BOARD1 is_of_class EIZ2R2A01_LAYER1_PCB8MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER1_PCB8_BOARD4 is_of_class EIZ2R2A01_LAYER1_PCB8MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER1_PCB8_BOARD1,
	EIZ2R2A01_LAYER1_PCB8_BOARD4 }
objectset: EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER1_PCB8_BOARD1,
	EIZ2R2A01_LAYER1_PCB8_BOARD4 }


objectset: EIZ2R2A01_LAYER1_PCB8FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER1_PCB8FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER1TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER1 is_of_class EIZ2R2A01_LAYER1TOP_MMG_ELTX_Layer_CLASS

class: EIZ2R2A01_LAYER1MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER1MMG_ELTX_Pcb_FWDM is_of_class EIZ2R2A01_LAYER1MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER1_PCB6,
	EIZ2R2A01_LAYER1_PCB7,
	EIZ2R2A01_LAYER1_PCB8 }
objectset: EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER1_PCB6,
	EIZ2R2A01_LAYER1_PCB7,
	EIZ2R2A01_LAYER1_PCB8 }


objectset: EIZ2R2A01_LAYER1FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER1FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER2_PCB6TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER2_PCB6 is_of_class EIZ2R2A01_LAYER2_PCB6TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER2_PCB6MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER2_PCB6MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER2_PCB6MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER2_PCB6MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER2_PCB6_BOARD2 is_of_class EIZ2R2A01_LAYER2_PCB6MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER2_PCB6_BOARD3 is_of_class EIZ2R2A01_LAYER2_PCB6MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER2_PCB6_BOARD2,
	EIZ2R2A01_LAYER2_PCB6_BOARD3 }
objectset: EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER2_PCB6_BOARD2,
	EIZ2R2A01_LAYER2_PCB6_BOARD3 }


objectset: EIZ2R2A01_LAYER2_PCB6FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER2_PCB6FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER2_PCB7TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER2_PCB7 is_of_class EIZ2R2A01_LAYER2_PCB7TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER2_PCB7MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER2_PCB7MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER2_PCB7MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER2_PCB7MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER2_PCB7_BOARD2 is_of_class EIZ2R2A01_LAYER2_PCB7MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER2_PCB7_BOARD3 is_of_class EIZ2R2A01_LAYER2_PCB7MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER2_PCB7_BOARD2,
	EIZ2R2A01_LAYER2_PCB7_BOARD3 }
objectset: EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER2_PCB7_BOARD2,
	EIZ2R2A01_LAYER2_PCB7_BOARD3 }


objectset: EIZ2R2A01_LAYER2_PCB7FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER2_PCB7FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER2_PCB8TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER2_PCB8 is_of_class EIZ2R2A01_LAYER2_PCB8TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER2_PCB8MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER2_PCB8MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER2_PCB8MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER2_PCB8MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER2_PCB8_BOARD2 is_of_class EIZ2R2A01_LAYER2_PCB8MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER2_PCB8_BOARD3 is_of_class EIZ2R2A01_LAYER2_PCB8MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER2_PCB8_BOARD2,
	EIZ2R2A01_LAYER2_PCB8_BOARD3 }
objectset: EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER2_PCB8_BOARD2,
	EIZ2R2A01_LAYER2_PCB8_BOARD3 }


objectset: EIZ2R2A01_LAYER2_PCB8FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER2_PCB8FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER2TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER2 is_of_class EIZ2R2A01_LAYER2TOP_MMG_ELTX_Layer_CLASS

class: EIZ2R2A01_LAYER2MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER2MMG_ELTX_Pcb_FWDM is_of_class EIZ2R2A01_LAYER2MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER2_PCB6,
	EIZ2R2A01_LAYER2_PCB7,
	EIZ2R2A01_LAYER2_PCB8 }
objectset: EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER2_PCB6,
	EIZ2R2A01_LAYER2_PCB7,
	EIZ2R2A01_LAYER2_PCB8 }


objectset: EIZ2R2A01_LAYER2FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER2FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER3_PCB6TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER3_PCB6 is_of_class EIZ2R2A01_LAYER3_PCB6TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER3_PCB6MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER3_PCB6MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER3_PCB6MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER3_PCB6MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER3_PCB6_BOARD1 is_of_class EIZ2R2A01_LAYER3_PCB6MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER3_PCB6_BOARD4 is_of_class EIZ2R2A01_LAYER3_PCB6MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER3_PCB6_BOARD1,
	EIZ2R2A01_LAYER3_PCB6_BOARD4 }
objectset: EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER3_PCB6_BOARD1,
	EIZ2R2A01_LAYER3_PCB6_BOARD4 }


objectset: EIZ2R2A01_LAYER3_PCB6FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER3_PCB6FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER3_PCB7TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER3_PCB7 is_of_class EIZ2R2A01_LAYER3_PCB7TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER3_PCB7MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER3_PCB7MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER3_PCB7MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER3_PCB7MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER3_PCB7_BOARD1 is_of_class EIZ2R2A01_LAYER3_PCB7MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER3_PCB7_BOARD4 is_of_class EIZ2R2A01_LAYER3_PCB7MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER3_PCB7_BOARD1,
	EIZ2R2A01_LAYER3_PCB7_BOARD4 }
objectset: EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER3_PCB7_BOARD1,
	EIZ2R2A01_LAYER3_PCB7_BOARD4 }


objectset: EIZ2R2A01_LAYER3_PCB7FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER3_PCB7FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER3_PCB8TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER3_PCB8 is_of_class EIZ2R2A01_LAYER3_PCB8TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER3_PCB8MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER3_PCB8MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER3_PCB8MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER3_PCB8MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER3_PCB8_BOARD1 is_of_class EIZ2R2A01_LAYER3_PCB8MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER3_PCB8_BOARD4 is_of_class EIZ2R2A01_LAYER3_PCB8MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER3_PCB8_BOARD1,
	EIZ2R2A01_LAYER3_PCB8_BOARD4 }
objectset: EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER3_PCB8_BOARD1,
	EIZ2R2A01_LAYER3_PCB8_BOARD4 }


objectset: EIZ2R2A01_LAYER3_PCB8FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER3_PCB8FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER3TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER3 is_of_class EIZ2R2A01_LAYER3TOP_MMG_ELTX_Layer_CLASS

class: EIZ2R2A01_LAYER3MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER3MMG_ELTX_Pcb_FWDM is_of_class EIZ2R2A01_LAYER3MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER3_PCB6,
	EIZ2R2A01_LAYER3_PCB7,
	EIZ2R2A01_LAYER3_PCB8 }
objectset: EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER3_PCB6,
	EIZ2R2A01_LAYER3_PCB7,
	EIZ2R2A01_LAYER3_PCB8 }


objectset: EIZ2R2A01_LAYER3FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER3FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER4_PCB6TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER4_PCB6 is_of_class EIZ2R2A01_LAYER4_PCB6TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER4_PCB6MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER4_PCB6MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER4_PCB6MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER4_PCB6MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER4_PCB6_BOARD1 is_of_class EIZ2R2A01_LAYER4_PCB6MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER4_PCB6_BOARD2 is_of_class EIZ2R2A01_LAYER4_PCB6MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER4_PCB6_BOARD3 is_of_class EIZ2R2A01_LAYER4_PCB6MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER4_PCB6_BOARD4 is_of_class EIZ2R2A01_LAYER4_PCB6MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER4_PCB6_BOARD1,
	EIZ2R2A01_LAYER4_PCB6_BOARD2,
	EIZ2R2A01_LAYER4_PCB6_BOARD3,
	EIZ2R2A01_LAYER4_PCB6_BOARD4 }
objectset: EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER4_PCB6_BOARD1,
	EIZ2R2A01_LAYER4_PCB6_BOARD2,
	EIZ2R2A01_LAYER4_PCB6_BOARD3,
	EIZ2R2A01_LAYER4_PCB6_BOARD4 }


objectset: EIZ2R2A01_LAYER4_PCB6FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER4_PCB6FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER4_PCB7TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER4_PCB7 is_of_class EIZ2R2A01_LAYER4_PCB7TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER4_PCB7MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER4_PCB7MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER4_PCB7MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER4_PCB7MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER4_PCB7_BOARD2 is_of_class EIZ2R2A01_LAYER4_PCB7MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER4_PCB7_BOARD3 is_of_class EIZ2R2A01_LAYER4_PCB7MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER4_PCB7_BOARD2,
	EIZ2R2A01_LAYER4_PCB7_BOARD3 }
objectset: EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER4_PCB7_BOARD2,
	EIZ2R2A01_LAYER4_PCB7_BOARD3 }


objectset: EIZ2R2A01_LAYER4_PCB7FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER4_PCB7FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER4_PCB8TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER4_PCB8 is_of_class EIZ2R2A01_LAYER4_PCB8TOP_MMG_ELTX_Pcb_CLASS

class: EIZ2R2A01_LAYER4_PCB8MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER4_PCB8MMG_ELTX_Board_FWDM is_of_class EIZ2R2A01_LAYER4_PCB8MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ2R2A01_LAYER4_PCB8MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ2R2A01_LAYER4_PCB8_BOARD2 is_of_class EIZ2R2A01_LAYER4_PCB8MMG_ELTX_Board_CLASS

object: EIZ2R2A01_LAYER4_PCB8_BOARD3 is_of_class EIZ2R2A01_LAYER4_PCB8MMG_ELTX_Board_CLASS

objectset: EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER4_PCB8_BOARD2,
	EIZ2R2A01_LAYER4_PCB8_BOARD3 }
objectset: EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER4_PCB8_BOARD2,
	EIZ2R2A01_LAYER4_PCB8_BOARD3 }


objectset: EIZ2R2A01_LAYER4_PCB8FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER4_PCB8FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01_LAYER4TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01_LAYER4 is_of_class EIZ2R2A01_LAYER4TOP_MMG_ELTX_Layer_CLASS

class: EIZ2R2A01_LAYER4MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ2R2A01_LAYER4MMG_ELTX_Pcb_FWDM is_of_class EIZ2R2A01_LAYER4MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER4_PCB6,
	EIZ2R2A01_LAYER4_PCB7,
	EIZ2R2A01_LAYER4_PCB8 }
objectset: EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER4_PCB6,
	EIZ2R2A01_LAYER4_PCB7,
	EIZ2R2A01_LAYER4_PCB8 }


objectset: EIZ2R2A01_LAYER4FWCHILDREN_FWSETACTIONS union {EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01_LAYER4FWCHILDREN_FWSETSTATES union {EIZ2R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ2R2A01TOP_MMG_ELTX_CHAMBER_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_CHAMBER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ2R2A01MMG_ELTX_LAYER_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ2R2A01MMG_ELTX_LAYER_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ2R2A01MMG_ELTX_LAYER_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ2R2A01MMG_ELTX_LAYER_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ2R2A01MMG_ELTX_LAYER_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ2R2A01 is_of_class EIZ2R2A01TOP_MMG_ELTX_CHAMBER_CLASS

class: EIZ2R2A01MMG_ELTX_Layer_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ2R2A01MMG_ELTX_LAYER_FWSETSTATES
            remove &VAL_OF_Device from EIZ2R2A01MMG_ELTX_LAYER_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ2R2A01MMG_ELTX_LAYER_FWSETSTATES
            insert &VAL_OF_Device in EIZ2R2A01MMG_ELTX_LAYER_FWSETACTIONS
            move_to READY

object: EIZ2R2A01MMG_ELTX_Layer_FWDM is_of_class EIZ2R2A01MMG_ELTX_Layer_FwDevMode_CLASS


objectset: EIZ2R2A01MMG_ELTX_LAYER_FWSETSTATES is_of_class VOID {EIZ2R2A01_LAYER1,
	EIZ2R2A01_LAYER2,
	EIZ2R2A01_LAYER3,
	EIZ2R2A01_LAYER4 }
objectset: EIZ2R2A01MMG_ELTX_LAYER_FWSETACTIONS is_of_class VOID {EIZ2R2A01_LAYER1,
	EIZ2R2A01_LAYER2,
	EIZ2R2A01_LAYER3,
	EIZ2R2A01_LAYER4 }


objectset: EIZ2R2A01FWCHILDREN_FWSETACTIONS union {EIZ2R2A01MMG_ELTX_LAYER_FWSETACTIONS } is_of_class VOID
objectset: EIZ2R2A01FWCHILDREN_FWSETSTATES union {EIZ2R2A01MMG_ELTX_LAYER_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER1_PCB1TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER1_PCB1 is_of_class EIZ3R1A01_LAYER1_PCB1TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER1_PCB1MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER1_PCB1MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER1_PCB1MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER1_PCB1MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER1_PCB1_BOARD1 is_of_class EIZ3R1A01_LAYER1_PCB1MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER1_PCB1_BOARD4 is_of_class EIZ3R1A01_LAYER1_PCB1MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER1_PCB1_BOARD1,
	EIZ3R1A01_LAYER1_PCB1_BOARD4 }
objectset: EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER1_PCB1_BOARD1,
	EIZ3R1A01_LAYER1_PCB1_BOARD4 }


objectset: EIZ3R1A01_LAYER1_PCB1FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER1_PCB1FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER1_PCB1MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER1_PCB2TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER1_PCB2 is_of_class EIZ3R1A01_LAYER1_PCB2TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER1_PCB2MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER1_PCB2MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER1_PCB2MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER1_PCB2MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER1_PCB2_BOARD1 is_of_class EIZ3R1A01_LAYER1_PCB2MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER1_PCB2_BOARD4 is_of_class EIZ3R1A01_LAYER1_PCB2MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER1_PCB2_BOARD1,
	EIZ3R1A01_LAYER1_PCB2_BOARD4 }
objectset: EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER1_PCB2_BOARD1,
	EIZ3R1A01_LAYER1_PCB2_BOARD4 }


objectset: EIZ3R1A01_LAYER1_PCB2FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER1_PCB2FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER1_PCB2MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER1_PCB3TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER1_PCB3 is_of_class EIZ3R1A01_LAYER1_PCB3TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER1_PCB3MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER1_PCB3MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER1_PCB3MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER1_PCB3MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER1_PCB3_BOARD1 is_of_class EIZ3R1A01_LAYER1_PCB3MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER1_PCB3_BOARD2 is_of_class EIZ3R1A01_LAYER1_PCB3MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER1_PCB3_BOARD3 is_of_class EIZ3R1A01_LAYER1_PCB3MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER1_PCB3_BOARD4 is_of_class EIZ3R1A01_LAYER1_PCB3MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER1_PCB3_BOARD1,
	EIZ3R1A01_LAYER1_PCB3_BOARD2,
	EIZ3R1A01_LAYER1_PCB3_BOARD3,
	EIZ3R1A01_LAYER1_PCB3_BOARD4 }
objectset: EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER1_PCB3_BOARD1,
	EIZ3R1A01_LAYER1_PCB3_BOARD2,
	EIZ3R1A01_LAYER1_PCB3_BOARD3,
	EIZ3R1A01_LAYER1_PCB3_BOARD4 }


objectset: EIZ3R1A01_LAYER1_PCB3FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER1_PCB3FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER1_PCB3MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER1_PCB4TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER1_PCB4 is_of_class EIZ3R1A01_LAYER1_PCB4TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER1_PCB4MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER1_PCB4MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER1_PCB4MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER1_PCB4MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER1_PCB4_BOARD1 is_of_class EIZ3R1A01_LAYER1_PCB4MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER1_PCB4_BOARD2 is_of_class EIZ3R1A01_LAYER1_PCB4MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER1_PCB4_BOARD3 is_of_class EIZ3R1A01_LAYER1_PCB4MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER1_PCB4_BOARD4 is_of_class EIZ3R1A01_LAYER1_PCB4MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER1_PCB4_BOARD1,
	EIZ3R1A01_LAYER1_PCB4_BOARD2,
	EIZ3R1A01_LAYER1_PCB4_BOARD3,
	EIZ3R1A01_LAYER1_PCB4_BOARD4 }
objectset: EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER1_PCB4_BOARD1,
	EIZ3R1A01_LAYER1_PCB4_BOARD2,
	EIZ3R1A01_LAYER1_PCB4_BOARD3,
	EIZ3R1A01_LAYER1_PCB4_BOARD4 }


objectset: EIZ3R1A01_LAYER1_PCB4FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER1_PCB4FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER1_PCB4MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER1_PCB5TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER1_PCB5 is_of_class EIZ3R1A01_LAYER1_PCB5TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER1_PCB5MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER1_PCB5MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER1_PCB5MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER1_PCB5MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER1_PCB5_BOARD1 is_of_class EIZ3R1A01_LAYER1_PCB5MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER1_PCB5_BOARD2 is_of_class EIZ3R1A01_LAYER1_PCB5MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER1_PCB5_BOARD3 is_of_class EIZ3R1A01_LAYER1_PCB5MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER1_PCB5_BOARD4 is_of_class EIZ3R1A01_LAYER1_PCB5MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER1_PCB5_BOARD1,
	EIZ3R1A01_LAYER1_PCB5_BOARD2,
	EIZ3R1A01_LAYER1_PCB5_BOARD3,
	EIZ3R1A01_LAYER1_PCB5_BOARD4 }
objectset: EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER1_PCB5_BOARD1,
	EIZ3R1A01_LAYER1_PCB5_BOARD2,
	EIZ3R1A01_LAYER1_PCB5_BOARD3,
	EIZ3R1A01_LAYER1_PCB5_BOARD4 }


objectset: EIZ3R1A01_LAYER1_PCB5FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER1_PCB5FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER1_PCB5MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER1TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER1 is_of_class EIZ3R1A01_LAYER1TOP_MMG_ELTX_Layer_CLASS

class: EIZ3R1A01_LAYER1MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER1MMG_ELTX_Pcb_FWDM is_of_class EIZ3R1A01_LAYER1MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER1_PCB1,
	EIZ3R1A01_LAYER1_PCB2,
	EIZ3R1A01_LAYER1_PCB3,
	EIZ3R1A01_LAYER1_PCB4,
	EIZ3R1A01_LAYER1_PCB5 }
objectset: EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER1_PCB1,
	EIZ3R1A01_LAYER1_PCB2,
	EIZ3R1A01_LAYER1_PCB3,
	EIZ3R1A01_LAYER1_PCB4,
	EIZ3R1A01_LAYER1_PCB5 }


objectset: EIZ3R1A01_LAYER1FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER1FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER1MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER2_PCB1TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER2_PCB1 is_of_class EIZ3R1A01_LAYER2_PCB1TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER2_PCB1MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER2_PCB1MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER2_PCB1MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER2_PCB1MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER2_PCB1_BOARD2 is_of_class EIZ3R1A01_LAYER2_PCB1MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER2_PCB1_BOARD3 is_of_class EIZ3R1A01_LAYER2_PCB1MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER2_PCB1_BOARD2,
	EIZ3R1A01_LAYER2_PCB1_BOARD3 }
objectset: EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER2_PCB1_BOARD2,
	EIZ3R1A01_LAYER2_PCB1_BOARD3 }


objectset: EIZ3R1A01_LAYER2_PCB1FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER2_PCB1FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER2_PCB1MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER2_PCB2TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER2_PCB2 is_of_class EIZ3R1A01_LAYER2_PCB2TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER2_PCB2MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER2_PCB2MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER2_PCB2MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER2_PCB2MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER2_PCB2_BOARD2 is_of_class EIZ3R1A01_LAYER2_PCB2MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER2_PCB2_BOARD3 is_of_class EIZ3R1A01_LAYER2_PCB2MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER2_PCB2_BOARD2,
	EIZ3R1A01_LAYER2_PCB2_BOARD3 }
objectset: EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER2_PCB2_BOARD2,
	EIZ3R1A01_LAYER2_PCB2_BOARD3 }


objectset: EIZ3R1A01_LAYER2_PCB2FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER2_PCB2FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER2_PCB2MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER2_PCB3TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER2_PCB3 is_of_class EIZ3R1A01_LAYER2_PCB3TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER2_PCB3MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER2_PCB3MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER2_PCB3MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER2_PCB3MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER2_PCB3_BOARD2 is_of_class EIZ3R1A01_LAYER2_PCB3MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER2_PCB3_BOARD3 is_of_class EIZ3R1A01_LAYER2_PCB3MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER2_PCB3_BOARD2,
	EIZ3R1A01_LAYER2_PCB3_BOARD3 }
objectset: EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER2_PCB3_BOARD2,
	EIZ3R1A01_LAYER2_PCB3_BOARD3 }


objectset: EIZ3R1A01_LAYER2_PCB3FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER2_PCB3FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER2_PCB3MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER2_PCB4TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER2_PCB4 is_of_class EIZ3R1A01_LAYER2_PCB4TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER2_PCB4MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER2_PCB4MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER2_PCB4MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER2_PCB4MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER2_PCB4_BOARD2 is_of_class EIZ3R1A01_LAYER2_PCB4MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER2_PCB4_BOARD3 is_of_class EIZ3R1A01_LAYER2_PCB4MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER2_PCB4_BOARD2,
	EIZ3R1A01_LAYER2_PCB4_BOARD3 }
objectset: EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER2_PCB4_BOARD2,
	EIZ3R1A01_LAYER2_PCB4_BOARD3 }


objectset: EIZ3R1A01_LAYER2_PCB4FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER2_PCB4FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER2_PCB4MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER2_PCB5TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER2_PCB5 is_of_class EIZ3R1A01_LAYER2_PCB5TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER2_PCB5MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER2_PCB5MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER2_PCB5MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER2_PCB5MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER2_PCB5_BOARD2 is_of_class EIZ3R1A01_LAYER2_PCB5MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER2_PCB5_BOARD3 is_of_class EIZ3R1A01_LAYER2_PCB5MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER2_PCB5_BOARD2,
	EIZ3R1A01_LAYER2_PCB5_BOARD3 }
objectset: EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER2_PCB5_BOARD2,
	EIZ3R1A01_LAYER2_PCB5_BOARD3 }


objectset: EIZ3R1A01_LAYER2_PCB5FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER2_PCB5FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER2_PCB5MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER2TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER2 is_of_class EIZ3R1A01_LAYER2TOP_MMG_ELTX_Layer_CLASS

class: EIZ3R1A01_LAYER2MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER2MMG_ELTX_Pcb_FWDM is_of_class EIZ3R1A01_LAYER2MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER2_PCB1,
	EIZ3R1A01_LAYER2_PCB2,
	EIZ3R1A01_LAYER2_PCB3,
	EIZ3R1A01_LAYER2_PCB4,
	EIZ3R1A01_LAYER2_PCB5 }
objectset: EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER2_PCB1,
	EIZ3R1A01_LAYER2_PCB2,
	EIZ3R1A01_LAYER2_PCB3,
	EIZ3R1A01_LAYER2_PCB4,
	EIZ3R1A01_LAYER2_PCB5 }


objectset: EIZ3R1A01_LAYER2FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER2FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER2MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER3_PCB1TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER3_PCB1 is_of_class EIZ3R1A01_LAYER3_PCB1TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER3_PCB1MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER3_PCB1MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER3_PCB1MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER3_PCB1MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER3_PCB1_BOARD1 is_of_class EIZ3R1A01_LAYER3_PCB1MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER3_PCB1_BOARD4 is_of_class EIZ3R1A01_LAYER3_PCB1MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER3_PCB1_BOARD1,
	EIZ3R1A01_LAYER3_PCB1_BOARD4 }
objectset: EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER3_PCB1_BOARD1,
	EIZ3R1A01_LAYER3_PCB1_BOARD4 }


objectset: EIZ3R1A01_LAYER3_PCB1FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER3_PCB1FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER3_PCB1MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER3_PCB2TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER3_PCB2 is_of_class EIZ3R1A01_LAYER3_PCB2TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER3_PCB2MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER3_PCB2MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER3_PCB2MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER3_PCB2MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER3_PCB2_BOARD1 is_of_class EIZ3R1A01_LAYER3_PCB2MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER3_PCB2_BOARD4 is_of_class EIZ3R1A01_LAYER3_PCB2MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER3_PCB2_BOARD1,
	EIZ3R1A01_LAYER3_PCB2_BOARD4 }
objectset: EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER3_PCB2_BOARD1,
	EIZ3R1A01_LAYER3_PCB2_BOARD4 }


objectset: EIZ3R1A01_LAYER3_PCB2FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER3_PCB2FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER3_PCB2MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER3_PCB3TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER3_PCB3 is_of_class EIZ3R1A01_LAYER3_PCB3TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER3_PCB3MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER3_PCB3MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER3_PCB3MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER3_PCB3MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER3_PCB3_BOARD1 is_of_class EIZ3R1A01_LAYER3_PCB3MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER3_PCB3_BOARD4 is_of_class EIZ3R1A01_LAYER3_PCB3MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER3_PCB3_BOARD1,
	EIZ3R1A01_LAYER3_PCB3_BOARD4 }
objectset: EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER3_PCB3_BOARD1,
	EIZ3R1A01_LAYER3_PCB3_BOARD4 }


objectset: EIZ3R1A01_LAYER3_PCB3FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER3_PCB3FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER3_PCB3MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER3_PCB4TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER3_PCB4 is_of_class EIZ3R1A01_LAYER3_PCB4TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER3_PCB4MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER3_PCB4MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER3_PCB4MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER3_PCB4MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER3_PCB4_BOARD1 is_of_class EIZ3R1A01_LAYER3_PCB4MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER3_PCB4_BOARD4 is_of_class EIZ3R1A01_LAYER3_PCB4MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER3_PCB4_BOARD1,
	EIZ3R1A01_LAYER3_PCB4_BOARD4 }
objectset: EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER3_PCB4_BOARD1,
	EIZ3R1A01_LAYER3_PCB4_BOARD4 }


objectset: EIZ3R1A01_LAYER3_PCB4FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER3_PCB4FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER3_PCB4MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER3_PCB5TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER3_PCB5 is_of_class EIZ3R1A01_LAYER3_PCB5TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER3_PCB5MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER3_PCB5MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER3_PCB5MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER3_PCB5MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER3_PCB5_BOARD1 is_of_class EIZ3R1A01_LAYER3_PCB5MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER3_PCB5_BOARD4 is_of_class EIZ3R1A01_LAYER3_PCB5MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER3_PCB5_BOARD1,
	EIZ3R1A01_LAYER3_PCB5_BOARD4 }
objectset: EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER3_PCB5_BOARD1,
	EIZ3R1A01_LAYER3_PCB5_BOARD4 }


objectset: EIZ3R1A01_LAYER3_PCB5FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER3_PCB5FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER3_PCB5MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER3TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER3 is_of_class EIZ3R1A01_LAYER3TOP_MMG_ELTX_Layer_CLASS

class: EIZ3R1A01_LAYER3MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER3MMG_ELTX_Pcb_FWDM is_of_class EIZ3R1A01_LAYER3MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER3_PCB1,
	EIZ3R1A01_LAYER3_PCB2,
	EIZ3R1A01_LAYER3_PCB3,
	EIZ3R1A01_LAYER3_PCB4,
	EIZ3R1A01_LAYER3_PCB5 }
objectset: EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER3_PCB1,
	EIZ3R1A01_LAYER3_PCB2,
	EIZ3R1A01_LAYER3_PCB3,
	EIZ3R1A01_LAYER3_PCB4,
	EIZ3R1A01_LAYER3_PCB5 }


objectset: EIZ3R1A01_LAYER3FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER3FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER3MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER4_PCB1TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER4_PCB1 is_of_class EIZ3R1A01_LAYER4_PCB1TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER4_PCB1MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER4_PCB1MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER4_PCB1MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER4_PCB1MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER4_PCB1_BOARD2 is_of_class EIZ3R1A01_LAYER4_PCB1MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER4_PCB1_BOARD3 is_of_class EIZ3R1A01_LAYER4_PCB1MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER4_PCB1_BOARD2,
	EIZ3R1A01_LAYER4_PCB1_BOARD3 }
objectset: EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER4_PCB1_BOARD2,
	EIZ3R1A01_LAYER4_PCB1_BOARD3 }


objectset: EIZ3R1A01_LAYER4_PCB1FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER4_PCB1FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER4_PCB1MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER4_PCB2TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER4_PCB2 is_of_class EIZ3R1A01_LAYER4_PCB2TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER4_PCB2MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER4_PCB2MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER4_PCB2MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER4_PCB2MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER4_PCB2_BOARD2 is_of_class EIZ3R1A01_LAYER4_PCB2MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER4_PCB2_BOARD3 is_of_class EIZ3R1A01_LAYER4_PCB2MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER4_PCB2_BOARD2,
	EIZ3R1A01_LAYER4_PCB2_BOARD3 }
objectset: EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER4_PCB2_BOARD2,
	EIZ3R1A01_LAYER4_PCB2_BOARD3 }


objectset: EIZ3R1A01_LAYER4_PCB2FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER4_PCB2FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER4_PCB2MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER4_PCB3TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER4_PCB3 is_of_class EIZ3R1A01_LAYER4_PCB3TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER4_PCB3MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER4_PCB3MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER4_PCB3MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER4_PCB3MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER4_PCB3_BOARD1 is_of_class EIZ3R1A01_LAYER4_PCB3MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER4_PCB3_BOARD2 is_of_class EIZ3R1A01_LAYER4_PCB3MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER4_PCB3_BOARD3 is_of_class EIZ3R1A01_LAYER4_PCB3MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER4_PCB3_BOARD4 is_of_class EIZ3R1A01_LAYER4_PCB3MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER4_PCB3_BOARD1,
	EIZ3R1A01_LAYER4_PCB3_BOARD2,
	EIZ3R1A01_LAYER4_PCB3_BOARD3,
	EIZ3R1A01_LAYER4_PCB3_BOARD4 }
objectset: EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER4_PCB3_BOARD1,
	EIZ3R1A01_LAYER4_PCB3_BOARD2,
	EIZ3R1A01_LAYER4_PCB3_BOARD3,
	EIZ3R1A01_LAYER4_PCB3_BOARD4 }


objectset: EIZ3R1A01_LAYER4_PCB3FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER4_PCB3FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER4_PCB3MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER4_PCB4TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER4_PCB4 is_of_class EIZ3R1A01_LAYER4_PCB4TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER4_PCB4MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER4_PCB4MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER4_PCB4MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER4_PCB4MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER4_PCB4_BOARD1 is_of_class EIZ3R1A01_LAYER4_PCB4MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER4_PCB4_BOARD2 is_of_class EIZ3R1A01_LAYER4_PCB4MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER4_PCB4_BOARD3 is_of_class EIZ3R1A01_LAYER4_PCB4MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER4_PCB4_BOARD4 is_of_class EIZ3R1A01_LAYER4_PCB4MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER4_PCB4_BOARD1,
	EIZ3R1A01_LAYER4_PCB4_BOARD2,
	EIZ3R1A01_LAYER4_PCB4_BOARD3,
	EIZ3R1A01_LAYER4_PCB4_BOARD4 }
objectset: EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER4_PCB4_BOARD1,
	EIZ3R1A01_LAYER4_PCB4_BOARD2,
	EIZ3R1A01_LAYER4_PCB4_BOARD3,
	EIZ3R1A01_LAYER4_PCB4_BOARD4 }


objectset: EIZ3R1A01_LAYER4_PCB4FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER4_PCB4FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER4_PCB4MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER4_PCB5TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER4_PCB5 is_of_class EIZ3R1A01_LAYER4_PCB5TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R1A01_LAYER4_PCB5MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER4_PCB5MMG_ELTX_Board_FWDM is_of_class EIZ3R1A01_LAYER4_PCB5MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R1A01_LAYER4_PCB5MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R1A01_LAYER4_PCB5_BOARD1 is_of_class EIZ3R1A01_LAYER4_PCB5MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER4_PCB5_BOARD2 is_of_class EIZ3R1A01_LAYER4_PCB5MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER4_PCB5_BOARD3 is_of_class EIZ3R1A01_LAYER4_PCB5MMG_ELTX_Board_CLASS

object: EIZ3R1A01_LAYER4_PCB5_BOARD4 is_of_class EIZ3R1A01_LAYER4_PCB5MMG_ELTX_Board_CLASS

objectset: EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER4_PCB5_BOARD1,
	EIZ3R1A01_LAYER4_PCB5_BOARD2,
	EIZ3R1A01_LAYER4_PCB5_BOARD3,
	EIZ3R1A01_LAYER4_PCB5_BOARD4 }
objectset: EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER4_PCB5_BOARD1,
	EIZ3R1A01_LAYER4_PCB5_BOARD2,
	EIZ3R1A01_LAYER4_PCB5_BOARD3,
	EIZ3R1A01_LAYER4_PCB5_BOARD4 }


objectset: EIZ3R1A01_LAYER4_PCB5FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER4_PCB5FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER4_PCB5MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01_LAYER4TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01_LAYER4 is_of_class EIZ3R1A01_LAYER4TOP_MMG_ELTX_Layer_CLASS

class: EIZ3R1A01_LAYER4MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ3R1A01_LAYER4MMG_ELTX_Pcb_FWDM is_of_class EIZ3R1A01_LAYER4MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER4_PCB1,
	EIZ3R1A01_LAYER4_PCB2,
	EIZ3R1A01_LAYER4_PCB3,
	EIZ3R1A01_LAYER4_PCB4,
	EIZ3R1A01_LAYER4_PCB5 }
objectset: EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER4_PCB1,
	EIZ3R1A01_LAYER4_PCB2,
	EIZ3R1A01_LAYER4_PCB3,
	EIZ3R1A01_LAYER4_PCB4,
	EIZ3R1A01_LAYER4_PCB5 }


objectset: EIZ3R1A01_LAYER4FWCHILDREN_FWSETACTIONS union {EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01_LAYER4FWCHILDREN_FWSETSTATES union {EIZ3R1A01_LAYER4MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ3R1A01TOP_MMG_ELTX_CHAMBER_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_CHAMBER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R1A01MMG_ELTX_LAYER_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R1A01MMG_ELTX_LAYER_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R1A01MMG_ELTX_LAYER_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R1A01MMG_ELTX_LAYER_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R1A01MMG_ELTX_LAYER_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R1A01 is_of_class EIZ3R1A01TOP_MMG_ELTX_CHAMBER_CLASS

class: EIZ3R1A01MMG_ELTX_Layer_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R1A01MMG_ELTX_LAYER_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R1A01MMG_ELTX_LAYER_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R1A01MMG_ELTX_LAYER_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R1A01MMG_ELTX_LAYER_FWSETACTIONS
            move_to READY

object: EIZ3R1A01MMG_ELTX_Layer_FWDM is_of_class EIZ3R1A01MMG_ELTX_Layer_FwDevMode_CLASS


objectset: EIZ3R1A01MMG_ELTX_LAYER_FWSETSTATES is_of_class VOID {EIZ3R1A01_LAYER1,
	EIZ3R1A01_LAYER2,
	EIZ3R1A01_LAYER3,
	EIZ3R1A01_LAYER4 }
objectset: EIZ3R1A01MMG_ELTX_LAYER_FWSETACTIONS is_of_class VOID {EIZ3R1A01_LAYER1,
	EIZ3R1A01_LAYER2,
	EIZ3R1A01_LAYER3,
	EIZ3R1A01_LAYER4 }


objectset: EIZ3R1A01FWCHILDREN_FWSETACTIONS union {EIZ3R1A01MMG_ELTX_LAYER_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R1A01FWCHILDREN_FWSETSTATES union {EIZ3R1A01MMG_ELTX_LAYER_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER1_PCB6TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER1_PCB6 is_of_class EIZ3R2A01_LAYER1_PCB6TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER1_PCB6MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER1_PCB6MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER1_PCB6MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER1_PCB6MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER1_PCB6_BOARD1 is_of_class EIZ3R2A01_LAYER1_PCB6MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER1_PCB6_BOARD2 is_of_class EIZ3R2A01_LAYER1_PCB6MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER1_PCB6_BOARD3 is_of_class EIZ3R2A01_LAYER1_PCB6MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER1_PCB6_BOARD4 is_of_class EIZ3R2A01_LAYER1_PCB6MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER1_PCB6_BOARD1,
	EIZ3R2A01_LAYER1_PCB6_BOARD2,
	EIZ3R2A01_LAYER1_PCB6_BOARD3,
	EIZ3R2A01_LAYER1_PCB6_BOARD4 }
objectset: EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER1_PCB6_BOARD1,
	EIZ3R2A01_LAYER1_PCB6_BOARD2,
	EIZ3R2A01_LAYER1_PCB6_BOARD3,
	EIZ3R2A01_LAYER1_PCB6_BOARD4 }


objectset: EIZ3R2A01_LAYER1_PCB6FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER1_PCB6FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER1_PCB6MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER1_PCB7TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER1_PCB7 is_of_class EIZ3R2A01_LAYER1_PCB7TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER1_PCB7MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER1_PCB7MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER1_PCB7MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER1_PCB7MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER1_PCB7_BOARD1 is_of_class EIZ3R2A01_LAYER1_PCB7MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER1_PCB7_BOARD4 is_of_class EIZ3R2A01_LAYER1_PCB7MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER1_PCB7_BOARD1,
	EIZ3R2A01_LAYER1_PCB7_BOARD4 }
objectset: EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER1_PCB7_BOARD1,
	EIZ3R2A01_LAYER1_PCB7_BOARD4 }


objectset: EIZ3R2A01_LAYER1_PCB7FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER1_PCB7FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER1_PCB7MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER1_PCB8TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER1_PCB8 is_of_class EIZ3R2A01_LAYER1_PCB8TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER1_PCB8MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER1_PCB8MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER1_PCB8MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER1_PCB8MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER1_PCB8_BOARD1 is_of_class EIZ3R2A01_LAYER1_PCB8MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER1_PCB8_BOARD4 is_of_class EIZ3R2A01_LAYER1_PCB8MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER1_PCB8_BOARD1,
	EIZ3R2A01_LAYER1_PCB8_BOARD4 }
objectset: EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER1_PCB8_BOARD1,
	EIZ3R2A01_LAYER1_PCB8_BOARD4 }


objectset: EIZ3R2A01_LAYER1_PCB8FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER1_PCB8FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER1_PCB8MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER1TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER1 is_of_class EIZ3R2A01_LAYER1TOP_MMG_ELTX_Layer_CLASS

class: EIZ3R2A01_LAYER1MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER1MMG_ELTX_Pcb_FWDM is_of_class EIZ3R2A01_LAYER1MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER1_PCB6,
	EIZ3R2A01_LAYER1_PCB7,
	EIZ3R2A01_LAYER1_PCB8 }
objectset: EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER1_PCB6,
	EIZ3R2A01_LAYER1_PCB7,
	EIZ3R2A01_LAYER1_PCB8 }


objectset: EIZ3R2A01_LAYER1FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER1FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER1MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER2_PCB6TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER2_PCB6 is_of_class EIZ3R2A01_LAYER2_PCB6TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER2_PCB6MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER2_PCB6MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER2_PCB6MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER2_PCB6MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER2_PCB6_BOARD2 is_of_class EIZ3R2A01_LAYER2_PCB6MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER2_PCB6_BOARD3 is_of_class EIZ3R2A01_LAYER2_PCB6MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER2_PCB6_BOARD2,
	EIZ3R2A01_LAYER2_PCB6_BOARD3 }
objectset: EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER2_PCB6_BOARD2,
	EIZ3R2A01_LAYER2_PCB6_BOARD3 }


objectset: EIZ3R2A01_LAYER2_PCB6FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER2_PCB6FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER2_PCB6MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER2_PCB7TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER2_PCB7 is_of_class EIZ3R2A01_LAYER2_PCB7TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER2_PCB7MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER2_PCB7MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER2_PCB7MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER2_PCB7MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER2_PCB7_BOARD2 is_of_class EIZ3R2A01_LAYER2_PCB7MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER2_PCB7_BOARD3 is_of_class EIZ3R2A01_LAYER2_PCB7MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER2_PCB7_BOARD2,
	EIZ3R2A01_LAYER2_PCB7_BOARD3 }
objectset: EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER2_PCB7_BOARD2,
	EIZ3R2A01_LAYER2_PCB7_BOARD3 }


objectset: EIZ3R2A01_LAYER2_PCB7FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER2_PCB7FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER2_PCB7MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER2_PCB8TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER2_PCB8 is_of_class EIZ3R2A01_LAYER2_PCB8TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER2_PCB8MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER2_PCB8MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER2_PCB8MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER2_PCB8MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER2_PCB8_BOARD2 is_of_class EIZ3R2A01_LAYER2_PCB8MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER2_PCB8_BOARD3 is_of_class EIZ3R2A01_LAYER2_PCB8MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER2_PCB8_BOARD2,
	EIZ3R2A01_LAYER2_PCB8_BOARD3 }
objectset: EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER2_PCB8_BOARD2,
	EIZ3R2A01_LAYER2_PCB8_BOARD3 }


objectset: EIZ3R2A01_LAYER2_PCB8FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER2_PCB8FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER2_PCB8MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER2TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER2 is_of_class EIZ3R2A01_LAYER2TOP_MMG_ELTX_Layer_CLASS

class: EIZ3R2A01_LAYER2MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER2MMG_ELTX_Pcb_FWDM is_of_class EIZ3R2A01_LAYER2MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER2_PCB6,
	EIZ3R2A01_LAYER2_PCB7,
	EIZ3R2A01_LAYER2_PCB8 }
objectset: EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER2_PCB6,
	EIZ3R2A01_LAYER2_PCB7,
	EIZ3R2A01_LAYER2_PCB8 }


objectset: EIZ3R2A01_LAYER2FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER2FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER2MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER3_PCB6TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER3_PCB6 is_of_class EIZ3R2A01_LAYER3_PCB6TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER3_PCB6MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER3_PCB6MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER3_PCB6MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER3_PCB6MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER3_PCB6_BOARD1 is_of_class EIZ3R2A01_LAYER3_PCB6MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER3_PCB6_BOARD4 is_of_class EIZ3R2A01_LAYER3_PCB6MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER3_PCB6_BOARD1,
	EIZ3R2A01_LAYER3_PCB6_BOARD4 }
objectset: EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER3_PCB6_BOARD1,
	EIZ3R2A01_LAYER3_PCB6_BOARD4 }


objectset: EIZ3R2A01_LAYER3_PCB6FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER3_PCB6FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER3_PCB6MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER3_PCB7TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER3_PCB7 is_of_class EIZ3R2A01_LAYER3_PCB7TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER3_PCB7MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER3_PCB7MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER3_PCB7MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER3_PCB7MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER3_PCB7_BOARD1 is_of_class EIZ3R2A01_LAYER3_PCB7MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER3_PCB7_BOARD4 is_of_class EIZ3R2A01_LAYER3_PCB7MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER3_PCB7_BOARD1,
	EIZ3R2A01_LAYER3_PCB7_BOARD4 }
objectset: EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER3_PCB7_BOARD1,
	EIZ3R2A01_LAYER3_PCB7_BOARD4 }


objectset: EIZ3R2A01_LAYER3_PCB7FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER3_PCB7FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER3_PCB7MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER3_PCB8TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER3_PCB8 is_of_class EIZ3R2A01_LAYER3_PCB8TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER3_PCB8MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER3_PCB8MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER3_PCB8MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER3_PCB8MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER3_PCB8_BOARD1 is_of_class EIZ3R2A01_LAYER3_PCB8MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER3_PCB8_BOARD4 is_of_class EIZ3R2A01_LAYER3_PCB8MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER3_PCB8_BOARD1,
	EIZ3R2A01_LAYER3_PCB8_BOARD4 }
objectset: EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER3_PCB8_BOARD1,
	EIZ3R2A01_LAYER3_PCB8_BOARD4 }


objectset: EIZ3R2A01_LAYER3_PCB8FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER3_PCB8FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER3_PCB8MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER3TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER3 is_of_class EIZ3R2A01_LAYER3TOP_MMG_ELTX_Layer_CLASS

class: EIZ3R2A01_LAYER3MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER3MMG_ELTX_Pcb_FWDM is_of_class EIZ3R2A01_LAYER3MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER3_PCB6,
	EIZ3R2A01_LAYER3_PCB7,
	EIZ3R2A01_LAYER3_PCB8 }
objectset: EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER3_PCB6,
	EIZ3R2A01_LAYER3_PCB7,
	EIZ3R2A01_LAYER3_PCB8 }


objectset: EIZ3R2A01_LAYER3FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER3FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER3MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER4_PCB6TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER4_PCB6 is_of_class EIZ3R2A01_LAYER4_PCB6TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER4_PCB6MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER4_PCB6MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER4_PCB6MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER4_PCB6MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER4_PCB6_BOARD1 is_of_class EIZ3R2A01_LAYER4_PCB6MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER4_PCB6_BOARD2 is_of_class EIZ3R2A01_LAYER4_PCB6MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER4_PCB6_BOARD3 is_of_class EIZ3R2A01_LAYER4_PCB6MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER4_PCB6_BOARD4 is_of_class EIZ3R2A01_LAYER4_PCB6MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER4_PCB6_BOARD1,
	EIZ3R2A01_LAYER4_PCB6_BOARD2,
	EIZ3R2A01_LAYER4_PCB6_BOARD3,
	EIZ3R2A01_LAYER4_PCB6_BOARD4 }
objectset: EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER4_PCB6_BOARD1,
	EIZ3R2A01_LAYER4_PCB6_BOARD2,
	EIZ3R2A01_LAYER4_PCB6_BOARD3,
	EIZ3R2A01_LAYER4_PCB6_BOARD4 }


objectset: EIZ3R2A01_LAYER4_PCB6FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER4_PCB6FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER4_PCB6MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER4_PCB7TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER4_PCB7 is_of_class EIZ3R2A01_LAYER4_PCB7TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER4_PCB7MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER4_PCB7MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER4_PCB7MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER4_PCB7MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER4_PCB7_BOARD2 is_of_class EIZ3R2A01_LAYER4_PCB7MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER4_PCB7_BOARD3 is_of_class EIZ3R2A01_LAYER4_PCB7MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER4_PCB7_BOARD2,
	EIZ3R2A01_LAYER4_PCB7_BOARD3 }
objectset: EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER4_PCB7_BOARD2,
	EIZ3R2A01_LAYER4_PCB7_BOARD3 }


objectset: EIZ3R2A01_LAYER4_PCB7FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER4_PCB7FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER4_PCB7MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER4_PCB8TOP_MMG_ELTX_Pcb_CLASS
!panel: MMG_ELTX_Pcb.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER4_PCB8 is_of_class EIZ3R2A01_LAYER4_PCB8TOP_MMG_ELTX_Pcb_CLASS

class: EIZ3R2A01_LAYER4_PCB8MMG_ELTX_Board_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER4_PCB8MMG_ELTX_Board_FWDM is_of_class EIZ3R2A01_LAYER4_PCB8MMG_ELTX_Board_FwDevMode_CLASS


class: EIZ3R2A01_LAYER4_PCB8MMG_ELTX_Board_CLASS/associated
!panel: MMG_ELTX_Board.pnl
    state: READY	!color: FwStateOKPhysics
    state: OVER_TEMP	!color: FwStateAttention1
    state: HIGH_TEMP	!color: FwStateAttention3
    state: CALIBRATION	!color: FwStateStandby
    state: DISCONNECTED	!color: FwAlarmOKNotPhysics
    state: LV_OFF	!color: FwStateShutdown
    state: UNKNOWN	!color: FwStateAttention2

object: EIZ3R2A01_LAYER4_PCB8_BOARD2 is_of_class EIZ3R2A01_LAYER4_PCB8MMG_ELTX_Board_CLASS

object: EIZ3R2A01_LAYER4_PCB8_BOARD3 is_of_class EIZ3R2A01_LAYER4_PCB8MMG_ELTX_Board_CLASS

objectset: EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER4_PCB8_BOARD2,
	EIZ3R2A01_LAYER4_PCB8_BOARD3 }
objectset: EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER4_PCB8_BOARD2,
	EIZ3R2A01_LAYER4_PCB8_BOARD3 }


objectset: EIZ3R2A01_LAYER4_PCB8FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER4_PCB8FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER4_PCB8MMG_ELTX_BOARD_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01_LAYER4TOP_MMG_ELTX_Layer_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_LAYER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01_LAYER4 is_of_class EIZ3R2A01_LAYER4TOP_MMG_ELTX_Layer_CLASS

class: EIZ3R2A01_LAYER4MMG_ELTX_Pcb_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS
            move_to READY

object: EIZ3R2A01_LAYER4MMG_ELTX_Pcb_FWDM is_of_class EIZ3R2A01_LAYER4MMG_ELTX_Pcb_FwDevMode_CLASS


objectset: EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER4_PCB6,
	EIZ3R2A01_LAYER4_PCB7,
	EIZ3R2A01_LAYER4_PCB8 }
objectset: EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER4_PCB6,
	EIZ3R2A01_LAYER4_PCB7,
	EIZ3R2A01_LAYER4_PCB8 }


objectset: EIZ3R2A01_LAYER4FWCHILDREN_FWSETACTIONS union {EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01_LAYER4FWCHILDREN_FWSETSTATES union {EIZ3R2A01_LAYER4MMG_ELTX_PCB_FWSETSTATES } is_of_class VOID

class: EIZ3R2A01TOP_MMG_ELTX_CHAMBER_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_CHAMBER.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in EIZ3R2A01MMG_ELTX_LAYER_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in EIZ3R2A01MMG_ELTX_LAYER_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in EIZ3R2A01MMG_ELTX_LAYER_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in EIZ3R2A01MMG_ELTX_LAYER_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in EIZ3R2A01MMG_ELTX_LAYER_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: EIZ3R2A01 is_of_class EIZ3R2A01TOP_MMG_ELTX_CHAMBER_CLASS

class: EIZ3R2A01MMG_ELTX_Layer_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from EIZ3R2A01MMG_ELTX_LAYER_FWSETSTATES
            remove &VAL_OF_Device from EIZ3R2A01MMG_ELTX_LAYER_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in EIZ3R2A01MMG_ELTX_LAYER_FWSETSTATES
            insert &VAL_OF_Device in EIZ3R2A01MMG_ELTX_LAYER_FWSETACTIONS
            move_to READY

object: EIZ3R2A01MMG_ELTX_Layer_FWDM is_of_class EIZ3R2A01MMG_ELTX_Layer_FwDevMode_CLASS


objectset: EIZ3R2A01MMG_ELTX_LAYER_FWSETSTATES is_of_class VOID {EIZ3R2A01_LAYER1,
	EIZ3R2A01_LAYER2,
	EIZ3R2A01_LAYER3,
	EIZ3R2A01_LAYER4 }
objectset: EIZ3R2A01MMG_ELTX_LAYER_FWSETACTIONS is_of_class VOID {EIZ3R2A01_LAYER1,
	EIZ3R2A01_LAYER2,
	EIZ3R2A01_LAYER3,
	EIZ3R2A01_LAYER4 }


objectset: EIZ3R2A01FWCHILDREN_FWSETACTIONS union {EIZ3R2A01MMG_ELTX_LAYER_FWSETACTIONS } is_of_class VOID
objectset: EIZ3R2A01FWCHILDREN_FWSETSTATES union {EIZ3R2A01MMG_ELTX_LAYER_FWSETSTATES } is_of_class VOID

class: MMG_ELTX_CHAMBER_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from MMG_ELTX_CHAMBER_FWSETSTATES
            remove &VAL_OF_Device from MMG_ELTX_CHAMBER_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in MMG_ELTX_CHAMBER_FWSETSTATES
            insert &VAL_OF_Device in MMG_ELTX_CHAMBER_FWSETACTIONS
            move_to READY

object: MMG_ELTX_CHAMBER_FWDM is_of_class MMG_ELTX_CHAMBER_FwDevMode_CLASS


objectset: MMG_ELTX_CHAMBER_FWSETSTATES is_of_class VOID {EIZ2R1A01,
	EIZ2R2A01,
	EIZ3R1A01,
	EIZ3R2A01 }
objectset: MMG_ELTX_CHAMBER_FWSETACTIONS is_of_class VOID {EIZ2R1A01,
	EIZ2R2A01,
	EIZ3R1A01,
	EIZ3R2A01 }

class: TOP_MMG_ELTX_Sector_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_SECTOR.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in FWCHILDREN_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( any_in FWCHILDREN_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( any_in FWCHILDREN_FWSETSTATES in_state ERROR ) move_to ERROR
        when ( all_in FWCHILDREN_FWSETSTATES in_state READY ) move_to READY
    state: ERROR	!color: FwStateAttention3
        when ( all_in FWCHILDREN_FWSETSTATES not_in_state ERROR ) move_to NOT_READY

object: MMG_SIDE_A_SECTOR_01 is_of_class TOP_MMG_ELTX_Sector_CLASS

class: FwChildrenMode_CLASS
!panel: FwChildrenMode.pnl
    state: Complete	!color: _3DFace
        when ( any_in FWDEVMODE_FWSETSTATES in_state DISABLED )  move_to IncompleteDev
    state: Incomplete	!color: FwStateAttention2
    state: IncompleteDev	!color: FwStateAttention1
        when (  ( all_in FWDEVMODE_FWSETSTATES not_in_state DISABLED )  ) move_to Complete
    state: IncompleteDead	!color: FwStateAttention3

object: MMG_SIDE_A_SECTOR_01_FWCNM is_of_class FwChildrenMode_CLASS

class: FwMode_CLASS
!panel: FwMode.pnl
    state: Excluded	!color: FwStateOKNotPhysics
        action: Take(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
            move_to InLocal
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            move_to Included
        action: Manual	!visible: 0
            move_to Manual
        action: Ignore	!visible: 0
            move_to Ignored
    state: Included	!color: FwStateOKPhysics
        action: Exclude(string OWNER = "")	!visible: 0
            move_to Excluded
        action: Manual(string OWNER = "")	!visible: 0
            move_to Manual
        action: Ignore(string OWNER = "")	!visible: 0
            move_to Ignored
        action: ExcludeAll(string OWNER = "")	!visible: 0
            move_to Excluded
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            move_to Included
        action: Free(string OWNER = "")	!visible: 0
            move_to Included
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
    state: InLocal	!color: FwStateOKNotPhysics
        action: Release(string OWNER = "")	!visible: 1
            move_to Excluded
        action: ReleaseAll(string OWNER = "")	!visible: 1
            move_to Excluded
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
        action: Take(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
            move_to InLocal
    state: Manual	!color: FwStateOKNotPhysics
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            move_to Included
        action: Take(string OWNER = "")	!visible: 1
            move_to InManual
        action: Exclude(string OWNER = "")	!visible: 0
            move_to Excluded
        action: Ignore	!visible: 0
            move_to Ignored
        action: Free(string OWNER = "")	!visible: 0
            move_to Excluded
        action: ExcludeAll(string OWNER = "")	!visible: 0
            move_to Excluded
    state: InManual	!color: FwStateOKNotPhysics
        action: Release(string OWNER = "")	!visible: 1
            move_to Manual
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
        action: ReleaseAll(string OWNER = "")	!visible: 0
            move_to Excluded
        action: SetInLocal	!visible: 0
            move_to InLocal
    state: Ignored	!color: FwStateOKNotPhysics
        action: Include	!visible: 0
            move_to Included
        action: Exclude(string OWNER = "")	!visible: 0
            move_to Excluded
        action: Manual	!visible: 0
            move_to Manual
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
        action: Free(string OWNER = "")	!visible: 0
            move_to Included
        action: ExcludeAll(string OWNER = "")	!visible: 0
            move_to Excluded

object: MMG_SIDE_A_SECTOR_01_FWM is_of_class FwMode_CLASS

class: ATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from ATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from ATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in ATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in ATLAS_STATUS_FWSETACTIONS
            move_to READY

object: ATLAS_STATUS_FWDM is_of_class ATLAS_STATUS_FwDevMode_CLASS


objectset: ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_MMG_SIDE_A_SECTOR_01 }
objectset: ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_MMG_SIDE_A_SECTOR_01 }

class: FwDevMode_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from FWDEVMODE_FWSETSTATES
            remove &VAL_OF_Device from FWDEVMODE_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in FWDEVMODE_FWSETSTATES
            insert &VAL_OF_Device in FWDEVMODE_FWSETACTIONS
            move_to READY

object: FwDevMode_FWDM is_of_class FwDevMode_FwDevMode_CLASS


class: FwDevMode_CLASS/associated
!panel: FwDevMode.pnl
    state: ENABLED	!color: FwStateOKPhysics
    state: DISABLED	!color: FwStateAttention1

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB5_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_PCB6_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_PCB7_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_PCB8_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01:STATUS_MMG_SIDE_A_SECTOR_01_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_SECTOR_01_FWDM is_of_class FwDevMode_CLASS

objectset: FWDEVMODE_FWSETSTATES is_of_class VOID {MMG_SIDE_A_SECTOR_01:EIZ2R1A01_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_MMG_SIDE_A_SECTOR_01_FWDM,
	MMG_SIDE_A_SECTOR_01_FWDM }
objectset: FWDEVMODE_FWSETACTIONS is_of_class VOID {MMG_SIDE_A_SECTOR_01:EIZ2R1A01_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER1_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER2_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER3_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R1A01_LAYER4_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER1_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER2_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER3_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ2R2A01_LAYER4_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER1_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER2_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER3_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R1A01_LAYER4_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER1_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER2_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER3_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:EIZ3R2A01_LAYER4_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER1_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER2_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER3_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R1A01_LAYER4_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER1_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER2_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER3_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ2R2A01_LAYER4_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER1_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER2_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER3_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R1A01_LAYER4_PCB5_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER1_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER2_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER3_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_PCB6_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_PCB7_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_EIZ3R2A01_LAYER4_PCB8_FWDM,
	MMG_SIDE_A_SECTOR_01:STATUS_MMG_SIDE_A_SECTOR_01_FWDM,
	MMG_SIDE_A_SECTOR_01_FWDM }


objectset: FWCHILDREN_FWSETACTIONS union {MMG_ELTX_CHAMBER_FWSETACTIONS,
	ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: FWCHILDREN_FWSETSTATES union {MMG_ELTX_CHAMBER_FWSETSTATES,
	ATLAS_STATUS_FWSETSTATES } is_of_class VOID

