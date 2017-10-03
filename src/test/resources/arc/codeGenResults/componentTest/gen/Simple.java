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

package componentTest.gen;

public abstract class Simple extends
    sim.generic.ASimpleComponent<java.lang.String, java.lang.Integer> implements
    componentTest.gen.interfaces.ISimple {

  public Simple() {
    super();
  }

  @Override
  public sim.generic.IIncomingPort<java.lang.String> getString() {
    return super.getPortIn();
  }

  @Override
  public sim.generic.IOutgoingPort<java.lang.Integer> getInteger() {
    return super.getPortOut();
  }

  /*
   * (non-Javadoc)
   * 
   * @see sim.generic.IComponent#checkInvariants()
   */
  @Override
  public void checkInvariants() throws sim.error.InvariantInjuredException {
  }

  /*
   * (non-Javadoc)
   * 
   * @see sim.generic.IComponent\#setPortScheduler(sim.IScheduler)
   */
  @Override
  public void setup(sim.IScheduler scheduler,
      sim.error.ISimulationErrorHandler errorHandler) {
    super.setup(scheduler, errorHandler);
  }
}
