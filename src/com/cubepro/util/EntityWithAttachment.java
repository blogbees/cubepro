package com.cubepro.util;

import com.cubepro.components.EntityType;

import java.util.Collection;

/**
 * This interface needs to be implemented in the entities which are having attachments.
 * 
 * @author sajeev.sreekantan
 *
 */
public interface EntityWithAttachment{
	
	/**
	 * Should be the primary key id of the entity
	 * 
	 * @return entity id
	 */
	public Long getEntityId();
	
	/**
	 * Entity type object
	 * 
	 * @return entity type
	 */
	public EntityType getEntityType();
	
	/**
	 * Fetch the attachment list for a specific entity
	 * 
	 * @return collection fo file attachments
	 */
	public Collection<FileAttachmentDTO<? extends EntityWithAttachment>> getAttachments();
}
