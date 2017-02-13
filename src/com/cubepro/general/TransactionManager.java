package com.cubepro.general;

/**
 * Manages all the transactions
 * 
 * @author sajeev.sreekantan
 *
 */
public interface TransactionManager {

	/**
	 * This method will wrap all the transactions and will handle the transaction management.
	 * 
	 * @param <ParamType>
	 * @param <ReturnType>
	 * @param params
	 * @param transInstance
	 * @return ReturnType 
	 */
	public <ParamType, ReturnType> ReturnType execute(ParamType params, TransactionBody<ParamType, ReturnType> transInstance);
}