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

package factoryTest.gen.helper;

public class MessageFactory implements sim.generic.IMessageFactory {

  private static MessageFactory theInstance;
  protected java.util.Map<java.lang.String, sim.generic.Tick<?>> tickMap;

  private MessageFactory() {
    tickMap = new java.util.HashMap<java.lang.String, sim.generic.Tick<?>>();
    setUpMap();
  }

  public static MessageFactory getInstance() {
    if (theInstance == null) {
      theInstance = new MessageFactory();
    }
    return theInstance;
  }

  @SuppressWarnings("unchecked")
  public <T> sim.generic.Tick<T> getTick(String tickType) {
    return (sim.generic.Tick<T>) tickMap.get(tickType);
  }

  protected void setUpMap() {
    tickMap.put("java.lang.Boolean", new sim.generic.Tick<java.lang.Boolean>());
    tickMap.put("java.lang.String", new sim.generic.Tick<java.lang.String>());
    tickMap.put("java.lang.Integer", new sim.generic.Tick<java.lang.Integer>());
  }

  @Override
  public <T> sim.generic.TickedMessage<T> getMessage(T data) {
    return new sim.generic.Message<T>(data);
  }
}
