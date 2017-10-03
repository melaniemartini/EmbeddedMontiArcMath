/*
 * ******************************************************************************
 * MontiCore Language Workbench, www.monticore.de
 * Copyright (c) 2017, MontiCore, All rights reserved.
 *
 * This project is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or (at your option) any later version.
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this project. If not, see <http://www.gnu.org/licenses/>.
 * ******************************************************************************
 */

package example1;
import example1.datatypes.Types;

component StatusControl {

    port in  DoorStat lfStat,
         in  DoorStat rfStat,
         in  DoorStat rlStat,
         in  DoorStat rrStat,
         in  DoorStat trunkStat,
         out LockStatus;
       
    ocl inv StatusCtrlAllLocked:
      let x = lfStat.size;
      in 
        lfStat.get(x).status == DoorStat.CLOSED &&
        rfStat.get(x).status == DoorStat.CLOSED &&
        lrStat.get(x).status == DoorStat.CLOSED &&
        rrStat.get(x).status == DoorStat.CLOSED &&
        trunkStat.get(x).status == DoorStat.CLOSED implies
        LockStatus.get(x+1).lockStatus == LockStatus.CLOSED;
    
    inv StatusCtrlAllOpened: 
      lfStat[x].status == DoorStat.OPENED && 
      rfStat[x].status == DoorStat.OPENED && 
      lrStat[x].status == DoorStat.OPENED && 
      rrStat[x].status == DoorStat.OPENED && 
      trunkStat[x].status == DoorStat.OPENED implies 
      LockStatus[x+1].lockStatus == LockStatus.OPENED;
      
    //inv StatusCtrlPartial:
      
      
    //inv StatusCtrlError:
      //lfStat.status == DoorStat.BLOCKED ||
      //rfStat.status == DoorStat.BLOCKED ||
      //lrStat.status == DoorStat.BLOCKED ||
      //rrStat.status == DoorStat.BLOCKED ||  
      //trunkStat.status == DoorStat.BLOCKED implies
      //locked@next.lockStatus = LockStatus.ERROR;
      
     
}
