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

package portTest.gen.ports;

public interface Basic2PortInterface {

  public sim.generic.IIncomingPort<java.lang.Integer> getInteger();

  public sim.generic.IIncomingPort<java.lang.String> getString();

  public sim.generic.IIncomingPort<java.lang.Boolean> getBool();

  public void integerMessageReceived(sim.generic.Message<java.lang.Integer> message);

  public void stringMessageReceived(sim.generic.Message<java.lang.String> message);

  public void boolMessageReceived(sim.generic.Message<java.lang.Boolean> message);
}
