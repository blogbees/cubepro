package com.cubepro.fees.service;

import java.util.List;

import org.hibernate.Session;

import com.cubepro.fees.FeesDetails;
import com.cubepro.fees.dao.FeesDetailsDAO;

public class FeesDetailService {
	public List<FeesDetails> getFeesDetails(int classId, Session session) throws Exception{
		List<FeesDetails> feesDetails = null;
		FeesDetailsDAO feesDetailsDAO = new FeesDetailsDAO(session);
		feesDetails = feesDetailsDAO.getFeesDetails(classId);
		return feesDetails;
	}
}
