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

component LimousineActuator {

    port in  ChangeCmd, 
         out LockStatus;

    component Door lf, rf, lr, rr;
    component Trunk;
    component StatusControl;
    
           
    connect ChangeCmd -> lf.ChangeCmd,
                    rf.ChangeCmd,
                    lr.ChangeCmd,
                    rr.ChangeCmd,
                    Trunk.ChangeCmd;
                    
    connect lf.ok -> StatusControl.lfOk;
    connect rf.ok -> StatusControl.rfOk;
    connect lr.ok -> StatusControl.lrOk;
    connect rr.ok -> StatusControl.rrOk;
    connect Trunk.ok -> StatusControl.trunkOk;
    
    connect StatusControl.LockStatus -> LockStatus;

}
