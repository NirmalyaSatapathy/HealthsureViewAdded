<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<title>Review Medicines</title>
<style>
@charset "UTF-8";

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #eef5f9;
	margin: 0;
	padding: 0;
}

.dashboard-container {
	max-width: 1200px;
	margin: 130px auto;
	padding: 2rem;
	background-color: #fff;
	border-radius: 0.75rem;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.dashboard-title {
	font-size: 22px;
	font-weight: bold;
	color: #2a3f54;
	margin-bottom: 1.5rem;
	text-align: center;
}

.summary-section {
	margin-bottom: 1.5rem;
	padding: 1rem 1.5rem;
	background-color: #f8f9fa;
	border-left: 4px solid #17a2b8;
	border-radius: 0.5rem;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
}

.summary-grid {
	display: flex;
	flex-wrap: wrap;
	gap: 1rem;
}

.summary-item {
	flex: 1 1 45%;
	font-size: 15px;
	color: #34495e;
}

.summary-item strong {
	color: #2a3f54;
}

.med-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.med-table th, .med-table td {
	padding: 12px;
	text-align: left;
	border: 1px solid #ddd;
	font-size: 15px;
}

.med-table th {
	background-color: #3f51b5;
	color: white;
}

.med-table td {
	background-color: #fff;
	color: #333;
}

.med-table tr:nth-child(even) td {
	background-color: #f2f2f2;
}

.med-table tr:hover td {
	background-color: #e9e9e9;
}
</style>
</head>
<body>
	<jsp:include page="/navbar/NavProvider.jsp" />
	<div class="dashboard-container">
		<div class="dashboard-title">Medicine Details</div>
		<div class="summary-section">
			<div class="summary-grid">
				<div class="summary-item">
					<strong>Prescription ID:</strong>
					<h:outputText
						value="#{procedureController.prescription.prescriptionId}" />
				</div>
				<div class="summary-item">
					<strong>Recipient Name:</strong>
					<h:outputText
						value="#{procedureController.procedure.recipient.firstName}" />
				</div>
				<div class="summary-item">
					<strong>Diagnosis:</strong>
					<h:outputText value="#{procedureController.procedure.diagnosis}" />
				</div>
				<div class="summary-item">
					<strong>Prescribed Doctor:</strong>
					<h:outputText
						value="#{procedureController.prescription.prescribedDoc.doctorName}" />
				</div>
				<div class="summary-item">
					<strong>Start Date:</strong>
					<h:outputText value="#{procedureController.prescription.startDate}">
						<f:convertDateTime pattern="yyyy-MM-dd" />
					</h:outputText>
				</div>
				<div class="summary-item">
					<strong>End Date:</strong>
					<h:outputText value="#{procedureController.prescription.endDate}">
						<f:convertDateTime pattern="yyyy-MM-dd" />
					</h:outputText>
				</div>
			</div>
		</div>
		<h:form prependId="false">
			<h:dataTable
				value="#{procedureController.currentPrescribedMedicines}" var="m"
				styleClass="med-table" border="1">
				<h:column>
					<f:facet name="header">
						<h:outputText value="Medicine Name" />
					</f:facet>
					<h:outputText value="#{m.medicineName}" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="Type" />
					</f:facet>
					<h:outputText value="#{m.type}" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="Dosage" />
					</f:facet>
					<h:outputText value="#{m.dosage}" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="Duration" />
					</f:facet>
					<h:outputText value="#{m.duration}" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="Start Date" />
					</f:facet>
					<h:outputText value="#{m.startDate}">
					<f:convertDateTime pattern="yyyy-MM-dd" />
                        </h:outputText>
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="End Date" />
					</f:facet>
					<h:outputText value="#{m.endDate}">
					<f:convertDateTime pattern="yyyy-MM-dd" />
                        </h:outputText>
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="Notes" />
					</f:facet>
					<h:outputText value="#{m.notes}" />
				</h:column>
				<h:column>
					<f:facet name="header">
						<h:outputText value="Action" />
					</f:facet>
					<h:commandButton value="edit"
						action="#{procedureController.editCurrentMedicine(m)}" />
				</h:column>
			</h:dataTable>
			<h:commandButton value="Back" styleClass="action-button secondary"
				action="PrescriptionDashboard?faces-redirect=true" />

		</h:form>
	</div>

</body>
	</html>
</f:view>