<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="ej" uri="/WEB-INF/EJ.tld"%>
<%@ page import="com.syncfusion.*"%>
<%@page import="datasource.GetJsonData" %>
<%
   GetJsonData obj =new GetJsonData();
    Object data = obj.getSpreadCFData();
    request.setAttribute("DataSource", data);
    %>
<script type="text/javascript" src="Scripts/jquery.validate.min.js"></script>
<script type="text/javascript" src="Scripts/jquery.validate.unobtrusive.min.js"></script>
<div class="cols-sample-area">

<ej:spreadsheet id="spreadsheet" allowFormulaBar="false" enableContextMenu="false" showRibbon="false" loadComplete="loadComplete">
	<ej:spreadsheet-scrollSettings width="900" height="500"></ej:spreadsheet-scrollSettings>
<ej:spreadsheet-sheets>
			<ej:spreadsheet-sheet>
				<ej:spreadsheet-sheet-rangeSettings>
					<ej:spreadsheet-sheet-rangeSetting dataSource="${DataSource}" showHeader="false"></ej:spreadsheet-sheet-rangeSetting>
				</ej:spreadsheet-sheet-rangeSettings>
			</ej:spreadsheet-sheet>
		</ej:spreadsheet-sheets>
</ej:spreadsheet>
</div>
<script>
    function loadComplete(args) {
        var xlFormat = this.XLFormat, xlCFormat = this.XLCFormat;
        this.sheetRename("Conditional Formatting");
        this.setWidthToColumns([165, 130, 37, 165, 130, 37, 129, 132]);
        this.mergeCells("A1:A5", true);
        this.mergeCells("D1:D5", true);
        this.mergeCells("G1:G5", true);
        this.mergeCells("G7:G11", true);
        this.mergeCells("A7:A11", true);
        this.mergeCells("D7:D11", true);
        xlCFormat.setCFRule({ "action": "greaterthan", "inputs": ["5000"], "color": "redft", "range": "E7:E11" });
        xlCFormat.setCFRule({ "action": "lessthan", "inputs": ["30"], "color": "yellowft", "range": "H1:H5" });
        xlCFormat.setCFRule({ "action": "between", "inputs": ["400", "500"], "color": "greenft", "range": "B7:B11" });
        xlCFormat.setCFRule({ "action": "equalto", "inputs": ["20"], "color": "redf", "range": "H7:H11" });
        xlCFormat.setCFRule({ "action": "textcontains", "inputs": ["loafers"], "color": "redt", "range": "B1:B5" });
        xlCFormat.setCFRule({ "action": "dateoccur", "inputs": ["02/04/2014"], "color": "redft", "range": "E1:E5" });
        xlFormat.format({ "style": { "font-weight": "bold", "font-size": "10pt", "vertical-align": "middle", "text-align": "center" } }, "A1:A13");
        xlFormat.format({ "style": { "font-weight": "bold", "font-size": "10pt", "vertical-align": "middle", "text-align": "center" } }, "D1:D13");
        xlFormat.format({ "style": { "font-weight": "bold", "font-size": "10pt", "vertical-align": "middle", "text-align": "center" } }, "G1:G7");
        this.performSelection("B1");
    }
</script>
<style>
.cols-sample-area {
	width: 900px;
	height: 500px;
}
</style>