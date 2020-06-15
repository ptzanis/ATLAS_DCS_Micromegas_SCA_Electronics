class: STATUS_MMG_SIDE_ATOP_ATLAS_STATUS_CLASS
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
        when ( STATUS_MMG_SIDE_AATLAS_STATUS_FWSETACTIONS empty ) stay_in_state
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) stay_in_state
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: OK	!color: FwStateOKPhysics
        when ( STATUS_MMG_SIDE_AATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state OK ) stay_in_state
        

    state: WARNING	!color: FwStateAttention1
        when ( STATUS_MMG_SIDE_AATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state WARNING ) stay_in_state
        
when ( all_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: ERROR	!color: FwStateAttention2
        when ( STATUS_MMG_SIDE_AATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state FATAL ) move_to FATAL
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state ERROR ) stay_in_state
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        

    state: FATAL	!color: FwStateAttention3
        when ( STATUS_MMG_SIDE_AATLAS_STATUS_FWSETACTIONS empty ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state {UNINITIALIZED,DEAD} ) move_to UNINITIALIZED
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state FATAL ) stay_in_state
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state ERROR ) move_to ERROR
        
when ( any_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state WARNING ) move_to WARNING
        
when ( all_in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES in_state OK ) move_to OK
        


object: STATUS_MMG_SIDE_A is_of_class STATUS_MMG_SIDE_ATOP_ATLAS_STATUS_CLASS

class: STATUS_MMG_SIDE_AATLAS_STATUS_FwDevMode_CLASS
    state: READY
        action: Disable(Device)
            remove &VAL_OF_Device from STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES
            remove &VAL_OF_Device from STATUS_MMG_SIDE_AATLAS_STATUS_FWSETACTIONS
            move_to READY
        action: Enable(Device)
            insert &VAL_OF_Device in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES
            insert &VAL_OF_Device in STATUS_MMG_SIDE_AATLAS_STATUS_FWSETACTIONS
            move_to READY

object: STATUS_MMG_SIDE_AATLAS_STATUS_FWDM is_of_class STATUS_MMG_SIDE_AATLAS_STATUS_FwDevMode_CLASS


class: ASS_ATLAS_STATUS_CLASS/associated
!panel: ATLAS_STATUS.pnl
    state: UNINITIALIZED	!color: _3DFace
    state: OK	!color: FwStateOKPhysics
    state: WARNING	!color: FwStateAttention1
    state: ERROR	!color: FwStateAttention2
    state: FATAL	!color: FwStateAttention3

object: MMG_SIDE_A_SECTOR_01::STATUS_MMG_SIDE_A_SECTOR_01 is_of_class ASS_ATLAS_STATUS_CLASS

objectset: STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES is_of_class VOID {MMG_SIDE_A_SECTOR_01::STATUS_MMG_SIDE_A_SECTOR_01 }
objectset: STATUS_MMG_SIDE_AATLAS_STATUS_FWSETACTIONS is_of_class VOID {MMG_SIDE_A_SECTOR_01::STATUS_MMG_SIDE_A_SECTOR_01 }


objectset: STATUS_MMG_SIDE_AFWCHILDREN_FWSETACTIONS union {STATUS_MMG_SIDE_AATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: STATUS_MMG_SIDE_AFWCHILDREN_FWSETSTATES union {STATUS_MMG_SIDE_AATLAS_STATUS_FWSETSTATES } is_of_class VOID

class: TOP_MMG_ELTX_Side_CLASS
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_SIDE.pnl
    state: READY	!color: FwStateOKPhysics
        when ( any_in MMG_ELTX_SECTOR_FWSETSTATES in_state NOT_READY ) move_to NOT_READY
        when ( any_in MMG_ELTX_SECTOR_FWSETSTATES in_state {DEAD,UNKNOWN} ) move_to UNKNOWN
        action: REFRESH	!visible: 1
            do REFRESH all_in FWCHILDREN_FWSETACTIONS
    state: NOT_READY	!color: FwStateOKNotPhysics
        when ( all_in MMG_ELTX_SECTOR_FWSETSTATES in_state READY ) move_to READY
        when ( any_in MMG_ELTX_SECTOR_FWSETSTATES in_state {DEAD,UNKNOWN} ) move_to UNKNOWN
        action: REFRESH	!visible: 1
            do REFRESH all_in FWCHILDREN_FWSETACTIONS
    state: UNKNOWN	!color: FwStateAttention2
        when ( all_in MMG_ELTX_SECTOR_FWSETSTATES in_state READY ) move_to READY
        when (  not ( any_in MMG_ELTX_SECTOR_FWSETSTATES in_state {UNKNOWN,DEAD} )  ) move_to NOT_READY
        when ( any_in MMG_ELTX_SECTOR_FWSETSTATES in_state {UNKNOWN,DEAD} )  stay_in_state UNKNOWN
        action: REFRESH	!visible: 1
            do REFRESH all_in FWCHILDREN_FWSETACTIONS

object: MMG_SIDE_A is_of_class TOP_MMG_ELTX_Side_CLASS

class: FwChildrenMode_CLASS
!panel: FwChildrenMode.pnl
    state: Complete	!color: _3DFace
        when ( any_in FWCHILDRENMODE_FWSETSTATES in_state IncompleteDead ) move_to IncompleteDead
        when (  ( any_in FWCHILDRENMODE_FWSETSTATES in_state DEAD ) and ( any_in FWCHILDMODE_FWSETSTATES in_state MANUAL )  ) move_to IncompleteDead
        when ( any_in FWCHILDRENMODE_FWSETSTATES in_state Incomplete )  move_to Incomplete
        when ( any_in FWCHILDMODE_FWSETSTATES not_in_state {Included,ExcludedPerm,LockedOutPerm} )  move_to Incomplete
        when ( any_in FWCHILDRENMODE_FWSETSTATES in_state IncompleteDev )  move_to IncompleteDev
        when ( any_in FWDEVMODE_FWSETSTATES in_state DISABLED )  move_to IncompleteDev
    state: Incomplete	!color: FwStateAttention2
        when ( any_in FWCHILDRENMODE_FWSETSTATES in_state IncompleteDead ) move_to IncompleteDead
        when (  ( any_in FWCHILDRENMODE_FWSETSTATES in_state DEAD ) and ( any_in FWCHILDMODE_FWSETSTATES in_state MANUAL )  ) move_to IncompleteDead
        when (  ( all_in FWCHILDMODE_FWSETSTATES in_state {Included,ExcludedPerm,LockedOutPerm} ) and
       ( all_in FWCHILDRENMODE_FWSETSTATES not_in_state Incomplete )  )  move_to Complete
    state: IncompleteDev	!color: FwStateAttention1
        when ( any_in FWCHILDRENMODE_FWSETSTATES in_state IncompleteDead ) move_to IncompleteDead
        when (  ( any_in FWCHILDRENMODE_FWSETSTATES in_state DEAD ) and ( any_in FWCHILDMODE_FWSETSTATES in_state MANUAL )  ) move_to IncompleteDead
        when (  ( any_in FWCHILDMODE_FWSETSTATES not_in_state {Included,ExcludedPerm,LockedOutPerm} ) or
       ( any_in FWCHILDRENMODE_FWSETSTATES in_state Incomplete )  )  move_to Incomplete
        when (  ( all_in FWDEVMODE_FWSETSTATES not_in_state DISABLED ) and
       ( all_in FWCHILDRENMODE_FWSETSTATES not_in_state IncompleteDev )  ) move_to Complete
    state: IncompleteDead	!color: FwStateAttention3
        when (  (  ( all_in FWCHILDRENMODE_FWSETSTATES not_in_state DEAD ) or ( all_in FWCHILDMODE_FWSETSTATES not_in_state MANUAL )  ) and ( all_in FWCHILDRENMODE_FWSETSTATES not_in_state IncompleteDead )  )  move_to Complete

object: MMG_SIDE_A_FWCNM is_of_class FwChildrenMode_CLASS

class: ASS_FwChildrenMode_CLASS/associated
!panel: FwChildrenMode.pnl
    state: Complete	!color: _3DFace
    state: Incomplete	!color: FwStateAttention2
    state: IncompleteDev	!color: FwStateAttention1
    state: IncompleteDead	!color: FwStateAttention3

object: MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM is_of_class ASS_FwChildrenMode_CLASS

objectset: FWCHILDRENMODE_FWSETSTATES is_of_class VOID

class: FwMode_CLASS
!panel: FwMode.pnl
    state: Excluded	!color: FwStateOKNotPhysics
        action: Take(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
            do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) all_in FWCHILDMODE_FWSETACTIONS
            move_to InLocal
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) all_in FWCHILDMODE_FWSETACTIONS
            move_to Included
        action: Manual	!visible: 0
            move_to Manual
        action: Ignore	!visible: 0
            move_to Ignored
    state: Included	!color: FwStateOKPhysics
        action: Exclude(string OWNER = "")	!visible: 0
            do Free(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Excluded
        action: Manual(string OWNER = "")	!visible: 0
            do Free(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Manual
        action: Ignore(string OWNER = "")	!visible: 0
            move_to Ignored
        action: ExcludeAll(string OWNER = "")	!visible: 0
            do ExcludeAll(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Excluded
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) all_in FWCHILDMODE_FWSETACTIONS
            move_to Included
        action: Free(string OWNER = "")	!visible: 0
            do Free(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Included
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            do SetMode(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) all_in FWCHILDMODE_FWSETACTIONS
    state: InLocal	!color: FwStateOKNotPhysics
        action: Release(string OWNER = "")	!visible: 1
            do Free(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Excluded
        action: ReleaseAll(string OWNER = "")	!visible: 1
            do ExcludeAll(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Excluded
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            do SetMode(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) all_in FWCHILDMODE_FWSETACTIONS
        action: Take(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
            do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) all_in FWCHILDMODE_FWSETACTIONS
            move_to InLocal
    state: Manual	!color: FwStateOKNotPhysics
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) all_in FWCHILDMODE_FWSETACTIONS
            move_to Included
        action: Take(string OWNER = "")	!visible: 1
            do Include(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to InManual
        action: Exclude(string OWNER = "")	!visible: 0
            do Exclude(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Excluded
        action: Ignore	!visible: 0
            move_to Ignored
        action: Free(string OWNER = "")	!visible: 0
            do Free(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Excluded
        action: ExcludeAll(string OWNER = "")	!visible: 0
            do ExcludeAll(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Excluded
    state: InManual	!color: FwStateOKNotPhysics
        action: Release(string OWNER = "")	!visible: 1
            do Free(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Manual
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            do SetMode(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) all_in FWCHILDMODE_FWSETACTIONS
        action: ReleaseAll(string OWNER = "")	!visible: 0
            do ExcludeAll(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Excluded
        action: SetInLocal	!visible: 0
            move_to InLocal
    state: Ignored	!color: FwStateOKNotPhysics
        action: Include	!visible: 0
            move_to Included
        action: Exclude(string OWNER = "")	!visible: 0
            do Exclude(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Excluded
        action: Manual	!visible: 0
            move_to Manual
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            do SetMode(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) all_in FWCHILDMODE_FWSETACTIONS
        action: Free(string OWNER = "")	!visible: 0
            do Free(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Included
        action: ExcludeAll(string OWNER = "")	!visible: 0
            do ExcludeAll(OWNER=OWNER) all_in FWCHILDMODE_FWSETACTIONS
            move_to Excluded

object: MMG_SIDE_A_FWM is_of_class FwMode_CLASS

class: ASS_FwMode_CLASS/associated
!panel: FwMode.pnl
    state: Excluded	!color: FwStateOKNotPhysics
        action: Take(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
        action: Manual	!visible: 0
        action: Ignore	!visible: 0
    state: Included	!color: FwStateOKPhysics
        action: Exclude(string OWNER = "")	!visible: 0
        action: Manual(string OWNER = "")	!visible: 0
        action: Ignore(string OWNER = "")	!visible: 0
        action: ExcludeAll(string OWNER = "")	!visible: 0
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
        action: Free(string OWNER = "")	!visible: 0
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
    state: InLocal	!color: FwStateOKNotPhysics
        action: Release(string OWNER = "")	!visible: 1
        action: ReleaseAll(string OWNER = "")	!visible: 1
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
        action: Take(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
    state: Manual	!color: FwStateOKNotPhysics
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
        action: Take(string OWNER = "")	!visible: 1
        action: Exclude(string OWNER = "")	!visible: 0
        action: Ignore	!visible: 0
        action: Free(string OWNER = "")	!visible: 0
        action: ExcludeAll(string OWNER = "")	!visible: 0
    state: InManual	!color: FwStateOKNotPhysics
        action: Release(string OWNER = "")	!visible: 1
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
        action: ReleaseAll(string OWNER = "")	!visible: 0
        action: SetInLocal	!visible: 0
    state: Ignored	!color: FwStateOKNotPhysics
        action: Include	!visible: 0
        action: Exclude(string OWNER = "")	!visible: 0
        action: Manual	!visible: 0
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
        action: Free(string OWNER = "")	!visible: 0
        action: ExcludeAll(string OWNER = "")	!visible: 0

object: MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM is_of_class ASS_FwMode_CLASS

class: MMG_SIDE_A_SECTOR_01_FwChildMode_CLASS

!panel: FwChildMode.pnl
    state: Excluded	!color: FwStateOKNotPhysics
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM not_in_state {Excluded, Manual} ) then
            !    else
                    move_to Excluded
            !    endif
            else
                do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETSTATES
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETACTIONS
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM in FWCHILDRENMODE_FWSETSTATES
            endif
            move_to Included
        action: Manual	!visible: 0
            do Manual MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETSTATES
            remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
            move_to Manual
        action: Ignore	!visible: 0
            do Ignore MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETACTIONS
            remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
            move_to Ignored
        action: LockOut	!visible: 1
            move_to LockedOut
        action: Exclude(string OWNER = "")	!visible: 1
            do Exclude(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
            remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
            remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
            move_to Excluded
        action: ExcludePerm(string OWNER = "")	!visible: 0
            move_to ExcludedPerm
        action: Exclude&LockOut(string OWNER = "")	!visible: 0
            move_to LockedOut
    state: Included	!color: FwStateOKPhysics
        when ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state Excluded )  do Exclude
        when ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state Ignored )  move_to IGNORED

        when ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state Manual )  move_to MANUAL

        when ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state Dead )  do Manual

        action: Exclude(string OWNER = "")	!visible: 1
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM not_in_state Included ) then
                if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state InManual ) then
                    do Release(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
                else
                        do Exclude(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                        remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                        remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                        remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
            !       else
            !            move_to Included
            !        endif
                endif
            else
                do Exclude(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
            endif
            move_to Excluded
        action: Manual(string OWNER = "")	!visible: 1
            do Manual(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETSTATES
            remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
            move_to Manual
        action: Ignore(string OWNER = "")	!visible: 1
            do Ignore(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETACTIONS
            remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
            move_to Ignored
        action: ExcludeAll(string OWNER = "")	!visible: 1
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM not_in_state {Included,Ignored,Manual} ) then
                if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state InManual ) then
                    do ReleaseAll(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
                else
                    move_to Included
                endif
            else
                do ExcludeAll(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
            endif
            move_to Excluded
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
            do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETSTATES
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETACTIONS
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM in FWCHILDRENMODE_FWSETSTATES
            move_to Included
        action: Free(string OWNER = "")	!visible: 0
            do Free(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            move_to Included
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            do SetMode(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
        action: ExcludePerm(string OWNER = "")	!visible: 0
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM not_in_state Included ) then
                if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state InManual ) then
                    do Release(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
                else
                    move_to Included
                endif
            else
                do Exclude(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
            endif
            move_to ExcludedPerm
        action: Exclude&LockOut(string OWNER = "")	!visible: 1
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM not_in_state Included ) then
                if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state InManual ) then
                    do Release(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
                else
                    if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state Dead ) then
                        do Exclude(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                        remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                        remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                        remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
                   else
                        move_to Included
                    endif
                endif
            else
                do Exclude(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
            endif
            move_to LockedOut
    state: Manual	!color: FwStateOKNotPhysics
        when ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state Included )  move_to EXCLUDED
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state Dead ) then
              move_to Manual
            endif
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM not_in_state InManual ) then
              do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
              insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETSTATES
              insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETACTIONS
              insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM in FWCHILDRENMODE_FWSETSTATES
            endif
              if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state Included ) then
                move_to Included
              endif
            move_to Manual
        action: Exclude(string OWNER = "")	!visible: 1
                do Exclude(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
            !    move_to Excluded
            !endif
            !    else
            !    endif
            !else
            !endif
            !    move_to Excluded
            !endif
            !move_to Manual
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state InManual ) then
                 do SetInLocal MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            endif
            move_to Excluded
        action: Ignore	!visible: 0
            do Ignore MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETACTIONS
            remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
            move_to Ignored
        action: Free(string OWNER = "")	!visible: 0
            do Free(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            !move_to Manual
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state InManual ) then
                 do SetInLocal MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            endif
            move_to Excluded
        action: ExcludeAll(string OWNER = "")	!visible: 1
            !    else
            !        move_to Included
            !    endif
            !else
            !endif
              do ExcludeAll(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
              remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
              remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
              remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
            !endif
            !move_to Manual
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state InManual ) then
                 do SetInLocal MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            endif
            move_to Excluded
        action: Manual	!visible: 0
            do Manual MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETSTATES
            remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
            move_to Manual
        action: Exclude&LockOut(string OWNER = "")	!visible: 1
                do Exclude(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
            !    move_to Excluded
            !endif
            !    else
            !    endif
            !else
            !endif
            !    move_to Excluded
            !endif
            !move_to Manual
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state InManual ) then
                 do SetInLocal MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            endif
            move_to LockedOut
    state: Ignored	!color: FwStateOKNotPhysics
        when ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state Included )  move_to INCLUDED

        when ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state Excluded ) move_to EXCLUDED

        when ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state Dead )  do Exclude

        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
            do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETSTATES
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETACTIONS
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM in FWCHILDRENMODE_FWSETSTATES
            move_to Included
        action: Exclude(string OWNER = "")	!visible: 1
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM not_in_state Included ) then
                if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state InManual ) then
                    do Release(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
                else
                    do Exclude(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
                endif
            else
                do Exclude(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
            endif
            move_to Excluded
        action: Manual(string OWNER = "")	!visible: 0
            do Manual(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETSTATES
            remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
            move_to Manual
        action: SetMode(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 0
            do SetMode(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
        action: Free(string OWNER = "")	!visible: 0
            do Free(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
            move_to Included
        action: ExcludeAll(string OWNER = "")	!visible: 1
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM not_in_state {Included,Ignored,Manual} ) then
                if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM in_state InManual ) then
                    do ReleaseAll(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                    remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
                else
                    move_to Included
                endif
            else
                do ExcludeAll(OWNER=OWNER) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETSTATES
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 from MMG_ELTX_SECTOR_FWSETACTIONS
                remove MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM from FWCHILDRENMODE_FWSETSTATES
            endif
            move_to Excluded
    state: LockedOut	!color: FwStateOKNotPhysics
        action: UnLockOut	!visible: 1
            move_to Excluded
        action: UnLockOut&Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM not_in_state Excluded ) then
            !    else
                    move_to LockedOut
            !    endif
            else
                do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETSTATES
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETACTIONS
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM in FWCHILDRENMODE_FWSETSTATES
            endif
            move_to Included
        action: LockOutPerm	!visible: 0
            move_to LockedOutPerm
    state: ExcludedPerm	!color: FwStateOKNotPhysics
        action: Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
            !    else
            !        move_to Excluded
            !    endif
            !else
            !endif
            !move_to Included
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM not_in_state {Excluded, Manual} ) then
                move_to ExcludedPerm
            else
                do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETSTATES
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETACTIONS
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM in FWCHILDRENMODE_FWSETSTATES
            endif
            move_to Included
        action: LockOut	!visible: 1
            move_to LockedOut
        action: Exclude(string OWNER = "")	!visible: 0
            move_to Excluded
    state: LockedOutPerm	!color: FwStateOKNotPhysics
        action: UnLockOut	!visible: 1
            move_to Excluded
        action: UnLockOut&Include(string OWNER = "",string EXCLUSIVE = "YES")	!visible: 1
            if ( MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM not_in_state Excluded ) then
            !    else
                    move_to LockedOutPerm
            !    endif
            else
                do Include(OWNER=OWNER,EXCLUSIVE=EXCLUSIVE) MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWM
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETSTATES
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 in MMG_ELTX_SECTOR_FWSETACTIONS
                insert MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01_FWCNM in FWCHILDRENMODE_FWSETSTATES
            endif
            move_to Included
        action: LockOut	!visible: 0
            move_to LockedOut

object: MMG_SIDE_A_SECTOR_01_FWM is_of_class MMG_SIDE_A_SECTOR_01_FwChildMode_CLASS

objectset: FWCHILDMODE_FWSETSTATES is_of_class VOID {MMG_SIDE_A_SECTOR_01_FWM }
objectset: FWCHILDMODE_FWSETACTIONS is_of_class VOID {MMG_SIDE_A_SECTOR_01_FWM }

class: ASS_MMG_ELTX_Sector_CLASS/associated
!panel: fwAtlasMainPanels/ATL_MMG_ELTX_SECTOR.pnl
    state: READY	!color: FwStateOKPhysics
        action: REFRESH	!visible: 1
    state: NOT_READY	!color: FwStateOKNotPhysics
        action: REFRESH	!visible: 1
    state: UNKNOWN	!color: FwStateAttention2
        action: REFRESH	!visible: 1

object: MMG_SIDE_A_SECTOR_01::MMG_SIDE_A_SECTOR_01 is_of_class ASS_MMG_ELTX_Sector_CLASS

objectset: MMG_ELTX_SECTOR_FWSETSTATES is_of_class VOID
objectset: MMG_ELTX_SECTOR_FWSETACTIONS is_of_class VOID

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


objectset: ATLAS_STATUS_FWSETSTATES is_of_class VOID {STATUS_MMG_SIDE_A }
objectset: ATLAS_STATUS_FWSETACTIONS is_of_class VOID {STATUS_MMG_SIDE_A }

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

object: MMG_SIDE_A:STATUS_MMG_SIDE_A_FWDM is_of_class FwDevMode_CLASS

object: MMG_SIDE_A_FWDM is_of_class FwDevMode_CLASS

objectset: FWDEVMODE_FWSETSTATES is_of_class VOID {MMG_SIDE_A:STATUS_MMG_SIDE_A_FWDM,
	MMG_SIDE_A_FWDM }
objectset: FWDEVMODE_FWSETACTIONS is_of_class VOID {MMG_SIDE_A:STATUS_MMG_SIDE_A_FWDM,
	MMG_SIDE_A_FWDM }


objectset: FWCHILDREN_FWSETACTIONS union {MMG_ELTX_SECTOR_FWSETACTIONS,
	ATLAS_STATUS_FWSETACTIONS } is_of_class VOID
objectset: FWCHILDREN_FWSETSTATES union {MMG_ELTX_SECTOR_FWSETSTATES,
	ATLAS_STATUS_FWSETSTATES } is_of_class VOID

