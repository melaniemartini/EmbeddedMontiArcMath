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

package a;
import java.lang.Boolean;

component R5 {
  
  port
    in String portIn,
    out Boolean somePort,
    out String portOut;
  
  component x.R5Partner p1;
  component x.R5Partner p2;
  component x.R5PartnerTwo p3;
  
  // correct
  connect portIn -> p1.portIn, p2.portIn;
  connect p1.portOut -> p3.Integer;
  connect p3.Boolean -> p2.Boolean;
  
  
  // port does not exist
  connect p1.notExists -> p3.inNotExists;
  connect p3.outNotExists -> somePort;

}
