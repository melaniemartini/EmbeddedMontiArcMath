package params;

/**
 * @brief adds a fix delay to a channel.
 * 
 * All messages received on port {@link portIn} are relayed
 * to {@link portOut} after a fix delay of {@code delay} time
 * units.
 * 
 * <br>
 * <br>
 * Copyright (c) 2017, MontiCore. All rights reserved.
 *
 * @author  (last commit) $Author: ahaber $
 *
 * @type T type of the delayed channel.
 * @param delay constant delay in time units.
 */
component ConstantDelay<T>(int delay) {
  
  timing instant;
  
  port 
    in T portIn,
    out T portOut;
   
}
