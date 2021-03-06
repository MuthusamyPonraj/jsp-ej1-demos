<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib prefix="ej" uri="/WEB-INF/EJ.tld" %><%@ page import="com.syncfusion.*" %><%@ page session="false" import="java.util.ArrayList" %><%@ page session="false" import="java.util.Iterator" %><%@ page import="datasource.GetJsonData" %>
<body>
	<div class="cols-sample-area"><%
GetJsonData obj=new GetJsonData();
    Object data = obj.GetKanbanJson();
    request.setAttribute("KanbanDataSource",data);
    %>
		<ej:kanban id="Kanban" keyField="Status" allowTitle="true" allowSelection="true" dataSource="${KanbanDataSource}">
			<ej:kanban-fields content="Summary" primaryKey="Id" imageUrl="ImgUrl"></ej:kanban-fields>
			<ej:kanban-columns>
				<ej:kanban-column headerText="Backlog" key="Open"></ej:kanban-column>
				<ej:kanban-column headerText="In Progress" key="InProgress"></ej:kanban-column>
				<ej:kanban-column headerText="Testing" key="Testing"></ej:kanban-column>
				<ej:kanban-column headerText="Done" key="Close" allowDrag="false"></ej:kanban-column>
			</ej:kanban-columns>
			<ej:kanban-workflows>
				<ej:kanban-workflow allowedTransitions="InProgress" key="Open"></ej:kanban-workflow>
				<ej:kanban-workflow allowedTransitions="Testing" key="InProgress"></ej:kanban-workflow>
				<ej:kanban-workflow allowedTransitions="Close" key="Testing"></ej:kanban-workflow>
			</ej:kanban-workflows>
		</ej:kanban>
	</div>
</body>
<style>
.cols-sample-area{
	display:block !important
}
</style></html>