/**
*****************************************************************************
*    COPYRIGHT, 2006 Med/One Leasing, Inc.
********************************************************************************
*
*             CONFIDENTIAL - Med/One Leasing, Inc.  (Med/One)
*
* This is an unpublished work, which is a trade secret, created in 2006
* Med/One owns all rights to this work and intends to maintain it in confidence
* to preserve its trade secret status. Med/One reserves the right to protect
* this work as an unpublished copyrighted work in the event of an inadvertent or
* deliberate unauthorized publication. Med/One also reserves its rights under the
* copyright laws to protect this work as a published work. Those having access
* to this work may not copy it, use it, or disclose the information contained
* in it without the written authorization of Med/One.
*
********************************************************************************
* NAME: PConstants.java
* LOCATION: First Anesthesia @OTO,
* BUSINESS OWNERS:  Steve Berman (Berman_S)
* PRIMARY PROJECT CONTACT:  Aravind Nadella (Nadella_A)
* DEVELOPED BY: First Anesthesia J2EE Team
*
* DESCRIPTION: 
* NOTES:
* DEPENDENCIES: 
* CHANGE HISTORY:
* 
* $Log: AESEncrypter.java,v $
* Revision 1.1  2009/04/25 10:20:19  aspire_bala
* Fixed 2430#c10 - Avoided re-login and popup while showing DCN image
*
* 
*/
package com.cubepro.components;

import java.io.IOException;
import java.security.InvalidKeyException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.spec.SecretKeySpec;

public class AESEncrypter {

	private Cipher cipher;
	
	public AESEncrypter() throws Exception {
		this.cipher = Cipher.getInstance("AES");
	}
	
	/**
	 * Method encrypts the passed string
	 * @param clearText
	 * @param encryptKey
	 * @return
	 * @throws InvalidKeyException 
	 * @throws BadPaddingException 
	 * @throws IllegalBlockSizeException 
	 * @throws Exception
	 */
	public String encrypt(String clearText, String encryptKey) throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
		this.cipher.init(Cipher.ENCRYPT_MODE, getSecretKeySpec(encryptKey));
		byte[] encrypted = this.cipher.doFinal(clearText.getBytes());
		// encode the encrypted byte.
		return new sun.misc.BASE64Encoder().encode(encrypted);
	}
	
	/**
	 * Method used to decrypt the encrypted string
	 * @param encryptedText
	 * @param encryptKey
	 * @return
	 * @throws InvalidKeyException 
	 * @throws IOException 
	 * @throws BadPaddingException 
	 * @throws IllegalBlockSizeException 
	 * @throws Exception
	 */
	public  String decrypt(String encryptedText, String encryptKey) throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException, IOException {
		this.cipher.init(Cipher.DECRYPT_MODE, getSecretKeySpec(encryptKey));
		// Decode the decrypted Text
		byte[] original = this.cipher.doFinal(new sun.misc.BASE64Decoder()
				.decodeBuffer(encryptedText));
		return new String(original);
	}

	/**
	 * @param encryptKey
	 * @return
	 */
	private SecretKeySpec getSecretKeySpec(String encryptKey) {
		return new SecretKeySpec(encryptKey.getBytes(), "AES");
	}
	
}
