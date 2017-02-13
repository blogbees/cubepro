package com.cubepro.components;

/**
 * Enums which are having code and name. 
 * The name may be used to display text in the drop down or radio button.
 * 
 * 
 * 
 */
public interface CodeAndNameEnum extends CodeEnum {

	/**
	 * This could be internal name or display name.
	 * 
	 * @return name of the enum.
	 */
	public String getName();
}
