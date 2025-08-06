package com.infinite.jsf.provider.dao;

import java.util.List;

import com.infinite.jsf.provider.model.PatientInsuranceDetails;

public interface InsuranceDao {
public List<PatientInsuranceDetails> showInsuranceOfRecipient(String recipientId);
}
