package org.impl;

import org.fidel.SpringContextLocator;
import org.springframework.context.ApplicationContext;

public class Implementor {
	public static void main(String[] args) {
		ApplicationContext context=SpringContextLocator.getApplicationContext();
           System.out.println("Checking weather it is null   "+context.getId().toString());
	}

}
