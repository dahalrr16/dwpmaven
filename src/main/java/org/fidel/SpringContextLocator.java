/**
 * 
 */
package org.fidel;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * @author dahalrr
 *
 */
public class SpringContextLocator implements ApplicationContextAware  {
	private static ApplicationContext applicationContext=null;

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	//@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		this.applicationContext=applicationContext;
		
	}

	

}
