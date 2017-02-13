package com.cubepro.menu;

import com.cubepro.roll.PermissionTypeEnum;
import com.cubepro.roll.RolePermission;

import java.util.Arrays;
import java.util.Collection;
import java.util.Map;

/**
 * Class to check whether a given Create/Read/Update/Delete/Allow permission(s)
 * is available for the user or not.
 * 
 * 
 * 
 */
public class MenuPermissionHelper {

	/**
	 * Method to check whether the any of the CRUD or Allow permission for the
	 * given 'permission' is available for the user or not
	 * 
	 * @param permissions
	 * @return
	 */
	boolean isCRUDAPermissionAvailable(Map<String, RolePermission> permissions,
			String crudPermissionName, String allowPermissionName) {
		boolean returnValue = isPermissionAvailable(permissions,
				crudPermissionName, PermissionTypeEnum.CRUD_PERMISSIONS);
		if (!returnValue) {
			return isAllowPermissionAvailable(permissions, allowPermissionName);
		}
		return returnValue;
	}

	/**
	 * Method to check whether the any of the CRUD permission for the given
	 * 'permission' is available for the user or not
	 * 
	 * @param permissions
	 * @return
	 */
	public boolean isCRUDPermissionAvailable(
			Map<String, RolePermission> permissions, String crudPermissionName) {
		return isPermissionAvailable(permissions, crudPermissionName,
				PermissionTypeEnum.CRUD_PERMISSIONS);
	}

	/**
	 * Method to check whether the 'Create' permission for the given
	 * 'permission' is available for the user or not
	 * 
	 * @param userPermissions
	 * @return
	 */
	public boolean isCreatePermissionAvailable(
			Map<String, RolePermission> userPermissions, String permission) {
		return isPermissionAvailable(userPermissions, permission, Arrays
				.asList(PermissionTypeEnum.CREATE));
	}

	/**
	 * Method to check whether the 'Read' permission for the given 'permission'
	 * is available for the user or not
	 * 
	 * @param userPermissions
	 * @return
	 */
	public boolean isReadPermissionAvailable(
			Map<String, RolePermission> userPermissions, String permission) {
		return isPermissionAvailable(userPermissions, permission, Arrays
				.asList(PermissionTypeEnum.READ));
	}

	/**
	 * Method to check whether the 'Update' permission for the given
	 * 'permission' is available for the user or not
	 * 
	 * @param userPermissions
	 * @return
	 */
	public boolean isUpdatePermissionAvailable(
			Map<String, RolePermission> userPermissions, String permission) {
		return isPermissionAvailable(userPermissions, permission, Arrays
				.asList(PermissionTypeEnum.UPDATE));
	}

	/**
	 * Method to check whether the Allow permission for the given
	 * 'allowPermissionName' is available for the user or not
	 * 
	 * @param userPermissions
	 * @param permissionName
	 * @return
	 */
	public boolean isAllowPermissionAvailable(
			Map<String, RolePermission> userPermissions, String permissionName) {
		return isPermissionAvailable(userPermissions, permissionName, Arrays
				.asList(PermissionTypeEnum.ALLOW));
	}

	/**
	 * Method to check whether the any of the CRU permission for the given
	 * 'permission' is available for the user or not
	 * 
	 * @param userPermissions
	 * @return
	 */
	public boolean isCRUPermissionAvailable(
			Map<String, RolePermission> userPermissions, String permission) {
		return isPermissionAvailable(userPermissions, permission,
				PermissionTypeEnum.CRU_PERMISSIONS);
	}

	private boolean isPermissionAvailable(
			Map<String, RolePermission> userPermissions, String permission,
			Collection<PermissionTypeEnum> permissionTypes) {
		RolePermission rolePermission = userPermissions.get(permission);
		boolean permissionAvailable = false;
		if (rolePermission != null) { // Check whether 'Create' permission is
										// available
			for (PermissionTypeEnum permissionType : permissionTypes) {
				switch (permissionType) {
				case CREATE:
					permissionAvailable = rolePermission.getCreate();
					break;
				case READ:
					permissionAvailable = rolePermission.getRead();
					break;
				case UPDATE:
					permissionAvailable = rolePermission.getUpdate();
					break;
				case DELETE:
					permissionAvailable = rolePermission.getDelete();
					break;
				case ALLOW:
					permissionAvailable = rolePermission.getAllow();
				}
				if (permissionAvailable) {
					break;
				}
			}
		}
		return permissionAvailable;
	}

	public boolean isPermissionAvailable(RolePermission userPermissions,
			String permission, Collection<PermissionTypeEnum> permissionTypes) {
		RolePermission rolePermission = userPermissions;
		boolean permissionAvailable = false;
		if (rolePermission != null) { // Check whether 'Create' permission is
										// available
			for (PermissionTypeEnum permissionType : permissionTypes) {
				switch (permissionType) {
				case CREATE:
					permissionAvailable = rolePermission.getCreate();
					break;
				case READ:
					permissionAvailable = rolePermission.getRead();
					break;
				case UPDATE:
					permissionAvailable = rolePermission.getUpdate();
					break;
				case DELETE:
					permissionAvailable = rolePermission.getDelete();
					break;
				case ALLOW:
					permissionAvailable = rolePermission.getAllow();
				}
				if (permissionAvailable) {
					break;
				}
			}
		}
		return permissionAvailable;
	}
}
