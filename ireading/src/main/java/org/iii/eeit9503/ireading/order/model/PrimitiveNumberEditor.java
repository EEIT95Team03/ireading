package org.iii.eeit9503.ireading.order.model;

import java.text.NumberFormat;

import org.springframework.beans.propertyeditors.CustomNumberEditor;

public class PrimitiveNumberEditor extends CustomNumberEditor{
  private boolean allowEmpty;
  private Class numberClass;


	public PrimitiveNumberEditor(Class<? extends Number> numberClass, boolean allowEmpty)
	throws IllegalArgumentException {
		
		this(numberClass,null,allowEmpty);
		// TODO Auto-generated constructor stub
	}

	public PrimitiveNumberEditor(Class<? extends Number> numberClass, NumberFormat numberFormat, boolean allowEmpty)
	throws IllegalArgumentException {
		super(numberClass, numberFormat, allowEmpty);
		this.allowEmpty=allowEmpty;
		this.numberClass=numberClass;
		// TODO Auto-generated constructor stub
	}
	
	@Override
public void setAsText(String text) throws IllegalArgumentException {
	// TODO Auto-generated method stub
		if((allowEmpty==false)||(text!=null && text.trim().length()!=0)){
	super.setAsText(text);}
		else{
//			if(numberClass==Integer.class){
//				setValue(-1);	
//			}
//			if(numberClass==Double.class){
//				setValue(-0.001);	
//			}
			setValue(0);		
		}
}


	
	

}
