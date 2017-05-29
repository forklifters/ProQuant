package DAO.dao;

import java.util.List;
import java.util.Map;

import PO.InfoData;

public interface InfoDataDao {

	void persist(InfoData transientInstance);

	void attachDirty(InfoData instance);

	void attachClean(InfoData instance);

	void delete(InfoData persistentInstance);

	InfoData merge(InfoData detachedInstance);

	InfoData findById(long id);

	List findByExample(InfoData instance);

	InfoData queryByHql(String code);
	
	String getCode(String name);
}