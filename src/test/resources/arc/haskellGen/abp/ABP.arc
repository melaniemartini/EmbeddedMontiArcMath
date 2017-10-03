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

package abp;

component ABP {
  port
    in String messageIn,
    out String messageOut;

   component Sender;
   component Receiver;
   component LossyChannel med1;
   component LossyChannel med2;
   component Delay;
      
   connect messageIn -> sender.messageIn;
   connect sender.messageOut -> med1.portIn;
   connect med1.portOut -> receiver.messageIn;
   connect receiver.messageOut -> messageOut;
   connect receiver.ack -> med2.portIn;
   connect med2.portOut -> delay.portIn;
   connect delay.portOut -> sender.ack;
}
