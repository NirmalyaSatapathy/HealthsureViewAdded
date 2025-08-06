<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>

<f:view>
<html>
<head>
    <meta charset="UTF-8">
    <title>Scheduled Procedures</title>
  <style>
    /* Page background: subtle clinic tone */
    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background-color: #f4f8fc; /* soft hospital background */
        color: #2f4f4f;
        padding: 20px;
        margin: 0;
    }

    h2 {
        color: #0277bd; /* calm blue */
        font-size: 28px;
        margin: 20px 0;
        border-bottom: 2px solid #b3e5fc;
        padding-bottom: 6px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        font-weight: bold;
        color: #004d40;
    }

    .error {
        color: #d32f2f;
        font-size: 12px;
        margin-left: 10px;
    }

    h\\:inputText {
        padding: 8px;
        border: 1px solid #b0bec5;
        border-radius: 4px;
        width: 250px;
        font-size: 14px;
    }

    h\\:commandButton {
        background-color: #0288d1;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 8px 14px;
        font-size: 14px;
        cursor: pointer;
        margin-right: 10px;
    }

    h\\:commandButton:hover {
        background-color: #01579b;
    }

    /* Data table styling */
    .data-table {
        width: 100%;
        margin-top: 30px;
        border-collapse: collapse;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    }

    /* Table headers: crisp and clean */
    .data-table th {
        background-color: #64b5f6; /* moderate hospital blue */
        color: #ffffff;
        font-weight: 600;
        padding: 10px;
        text-align: center;
        border: 1px solid #90caf9;
    }

  .data-table tr:nth-child(odd) {
    background-color: #ffffff;   /* pure white */
}

.data-table tr:nth-child(even) {
    background-color: #eaf6ff;   /* lightest tint of column blue (header: #64b5f6) */
}

    /* Table cells */
    .data-table td {
        border: 1px solid #cfd8dc;
        padding: 10px;
        font-size: 15px;
        text-align: center;
    }

    /* Row hover */
    .data-table tr:hover {
        background-color: #e3f2fd; /* soft blue highlight */
    }

    /* Responsive design */
    @media (max-width: 600px) {
        h2 {
            font-size: 24px;
        }
        .data-table th,
        .data-table td {
            font-size: 13px;
            padding: 6px;
        }
        h\\:inputText {
            width: 100%;
        }
    }
</style>
</head>
<body>
    <h:form prependId="false">
        <h2>Search Scheduled Procedures</h2>
        <br/>

        <div class="form-group">
            <label><span style="color: red;">*</span>Doctor ID:</label>
            <h:inputText id="doctorId" value="#{procedureController.doctorId}" />
            <h:message for="doctorId" styleClass="error" />
        </div>

        <div class="form-group">
            <label>Procedure ID (optional):</label>
            <h:inputText id="procedureId" value="#{procedureController.procedureId}" />
            <h:message for="procedureId" styleClass="error" />
        </div>

        <div class="form-group">
            <h:commandButton value="Search"
                             action="#{procedureController.fetchScheduledProceduresController()}" />
            &nbsp;&nbsp;
            <h:commandButton value="Reset"
                             action="#{procedureController.resetPage()}"
                             immediate="true" />
            &nbsp;&nbsp;
            <h:commandButton value="Go to Dashboard"
                             action="#{procedureController.goToDashboard1()}" />
        </div>

        <h:panelGroup rendered="#{not empty procedureController.scheduledProcedures}">
            <h:outputText value="Total: #{procedureController.allScheduledProcedures.size()} procedures"
                          style="font-weight: bold;" />

            <h:dataTable value="#{procedureController.scheduledProcedures}"
                         var="p"
                         styleClass="data-table">

                <h:column>
                    <f:facet name="header">
                        <h:commandLink action="#{procedureController.sortBy('appointmentId')}">
                            <span class="sort-header">
                                Appointment ID
                                <h:outputText styleClass="arrow"
                                    value="#{procedureController.sortField eq 'appointmentId'
                                            ? (procedureController.sortAscending ? '↑' : '↓') : ''}" />
                            </span>
                        </h:commandLink>
                    </f:facet>
                    <h:outputText value="#{p.appointment.appointmentId}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:commandLink action="#{procedureController.sortBy('procedureId')}">
                            <span class="sort-header">
                                Procedure ID
                                <h:outputText styleClass="arrow"
                                    value="#{procedureController.sortField eq 'procedureId'
                                            ? (procedureController.sortAscending ? '↑' : '↓') : ''}" />
                            </span>
                        </h:commandLink>
                    </f:facet>
                    <h:outputText value="#{p.procedureId}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:commandLink action="#{procedureController.sortBy('recipientFirstName')}">
                            <span class="sort-header">
                                Recipient First Name
                                <h:outputText styleClass="arrow"
                                    value="#{procedureController.sortField eq 'recipientFirstName'
                                            ? (procedureController.sortAscending ? '↑' : '↓') : ''}" />
                            </span>
                        </h:commandLink>
                    </f:facet>
                    <h:outputText value="#{p.recipient.firstName}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:commandLink action="#{procedureController.sortBy('recipientLastName')}">
                            <span class="sort-header">
                                Recipient Last Name
                                <h:outputText styleClass="arrow"
                                    value="#{procedureController.sortField eq 'recipientLastName'
                                            ? (procedureController.sortAscending ? '↑' : '↓') : ''}" />
                            </span>
                        </h:commandLink>
                    </f:facet>
                    <h:outputText value="#{p.recipient.lastName}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:commandLink action="#{procedureController.sortBy('doctorName')}">
                            <span class="sort-header">
                                Doctor
                                <h:outputText styleClass="arrow"
                                    value="#{procedureController.sortField eq 'doctorName'
                                            ? (procedureController.sortAscending ? '↑' : '↓') : ''}" />
                            </span>
                        </h:commandLink>
                    </f:facet>
                    <h:outputText value="#{p.doctor.doctorName}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:commandLink action="#{procedureController.sortBy('providerName')}">
                            <span class="sort-header">
                                Provider
                                <h:outputText styleClass="arrow"
                                    value="#{procedureController.sortField eq 'providerName'
                                            ? (procedureController.sortAscending ? '↑' : '↓') : ''}" />
                            </span>
                        </h:commandLink>
                    </f:facet>
                    <h:outputText value="#{p.provider.name}" />
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:commandLink action="#{procedureController.sortBy('scheduledDate')}">
                            <span class="sort-header">
                                Scheduled Date
                                <h:outputText styleClass="arrow"
                                    value="#{procedureController.sortField eq 'scheduledDate'
                                            ? (procedureController.sortAscending ? '↑' : '↓') : ''}" />
                            </span>
                        </h:commandLink>
                    </f:facet>
                    <h:outputText value="#{p.scheduledDate}">
                        <f:convertDateTime pattern="yyyy-MM-dd" />
                    </h:outputText>
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Action" />
                    </f:facet>
                    <h:commandButton value="Start Procedure"
                                     action="#{procedureController.startProcedure(p)}" />
                </h:column>

            </h:dataTable>

            <!-- Pagination Controls -->
            <br/>

            <h:panelGrid columns="5" cellpadding="10">
                <h:commandButton value="First"
                                 action="#{procedureController.goToFirstPage()}"
                                 disabled="#{!procedureController.hasPreviousPage()}" />

                <h:commandButton value="Previous"
                                 action="#{procedureController.previousPage()}"
                                 disabled="#{!procedureController.hasPreviousPage()}" />

                <h:outputText value="Page #{procedureController.currentPage} of #{procedureController.totalPages}"
                              style="font-weight: bold;" />

                <h:commandButton value="Next"
                                 action="#{procedureController.nextPage()}"
                                 disabled="#{!procedureController.hasNextPage()}" />

                <h:commandButton value="Last"
                                 action="#{procedureController.goToLastPage()}"
                                 disabled="#{!procedureController.hasNextPage()}" />
            </h:panelGrid>
        </h:panelGroup>
    </h:form>
</body>
</html>
</f:view>