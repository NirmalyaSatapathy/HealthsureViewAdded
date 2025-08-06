<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view>
<html>
<head>
    <title>Edit In-Progress Medical Procedure</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/EditInProgressProcedure.css" />
    <!-- Disable caching -->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <script type="text/javascript">
        window.addEventListener('pageshow', function(event) {
            var navEntries = performance.getEntriesByType && performance.getEntriesByType("navigation");
            var navType = navEntries && navEntries.length ? navEntries[0].type : "";
            if (event.persisted || navType === "back_forward") {
                document.querySelectorAll('.error').forEach(function(el) {
                    el.textContent = '';
                });
            }
        });
    </script>
</head>
<body>
    <div class="page-wrapper">
        <jsp:include page="/navbar/NavProvider.jsp" />

        <div class="main-content">
            <div class="form-container">
                <div class="form-title">Edit  Medical Procedure</div>

                <h:form prependId="false">
                    <h:messages globalOnly="true" styleClass="error" />

                    <div class="form-grid">
                        <div class="form-group">
                            <label for="procedureId">Procedure ID</label>
                            <h:inputText id="procedureId" value="#{procedureController.procedure.procedureId}" readonly="true" styleClass="form-control" />
                            <h:message for="procedureId" styleClass="error" />
                        </div>

                        <div class="form-group">
                            <label for="appointmentId">Appointment ID <span style="color:red">*</span></label>
                            <h:inputText id="appointmentId" value="#{procedureController.procedure.appointment.appointmentId}" readonly="true" styleClass="form-control" />
                            <h:message for="appointmentId" styleClass="error" />
                        </div>

                        <div class="form-group">
                            <label for="recipientId">Patient (h_id) <span style="color:red">*</span></label>
                            <h:inputText id="recipientId" value="#{procedureController.procedure.recipient.hId}" readonly="true" styleClass="form-control" />
                            <h:message for="recipientId" styleClass="error" />
                        </div>

                        <div class="form-group">
                            <label for="providerId">Provider ID <span style="color:red">*</span></label>
                            <h:inputText id="providerId" value="#{procedureController.procedure.provider.providerId}" readonly="true" styleClass="form-control" />
                            <h:message for="providerId" styleClass="error" />
                        </div>

                        <div class="form-group">
                            <label for="doctorId">Doctor ID <span style="color:red">*</span></label>
                            <h:inputText id="doctorId" value="#{procedureController.procedure.doctor.doctorId}" readonly="true" styleClass="form-control" />
                            <h:message for="doctorId" styleClass="error" />
                        </div>

                        <div class="form-group">
                            <label for="startDate">Start Date <span style="color:red">*</span></label>
                            <h:inputText id="startDate" value="#{procedureController.procedure.fromDate}"  styleClass="form-control"readonly="true">
                                <f:convertDateTime pattern="yyyy-MM-dd" />
                            </h:inputText>
                            <h:message for="startDate" styleClass="error" />
                             <script>
                                let s = document.querySelector('#startDate');
                                if (s) s.setAttribute('type', 'date');
                            </script>
                        </div>

                        <div class="form-group full-width">
                            <label for="diagnosis"><span style="color:red">*</span>Diagnosis</label>
                            <h:inputTextarea id="diagnosis" value="#{procedureController.procedure.diagnosis}" styleClass="form-control" />
                            <h:message for="diagnosis" styleClass="error" />
                        </div>

                        <div class="form-group full-width">
                            <label for="recommendations">Recommendations</label>
                            <h:inputTextarea id="recommendations" value="#{procedureController.procedure.recommendations}" styleClass="form-control" />
                            <h:message for="recommendations" styleClass="error" />
                        </div>
                    </div>

                    <div class="button-group">
                        <h:commandButton value="save Procedure"
                                         styleClass="btn-add"
                                         action="#{procedureController.updateInprogressProcedure(procedureController.procedure)}" />

                        <h:commandButton value="Reset Form"
                                         styleClass="btn-reset"
                                         action="#{procedureController.resetInProgress()}" />
                                          <h:commandButton value="back"
							action="#{procedureController.backFromViewPrescription()}"
							styleClass="shared-button" />
                    </div>
                </h:form>
            </div>
        </div>
    </div>
</body>
</html>
</f:view>