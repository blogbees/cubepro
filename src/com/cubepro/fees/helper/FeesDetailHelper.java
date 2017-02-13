package com.cubepro.fees.helper;

import java.util.List;

import org.hibernate.Session;

import com.cubepro.fees.FeesDetails;
import com.cubepro.fees.service.FeesDetailService;

public class FeesDetailHelper {

	public List<FeesDetails> getFeesDetails(int classId, Session session) throws Exception{
		List<FeesDetails> feesDetails = null;
		FeesDetailService feesDetailsService = new FeesDetailService();
		feesDetails = feesDetailsService.getFeesDetails(classId,session);
		return feesDetails;
	}
}
