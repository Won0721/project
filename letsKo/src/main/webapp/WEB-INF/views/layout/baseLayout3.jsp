<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<title>
		<c:choose>
			<c:when test="${title != null}">${title}</c:when>
			<c:otherwise>고속버스2</c:otherwise>
		</c:choose>
	</title>
	<style type="text/css">
		#wrapper {
		    overflow-x: hidden;
		    position: relative;
		    width: 100%;
		    min-width: 320px;
		    min-height: 100%;
		}
		.contentWrap {
			width: calc(100% - 220px);
		    box-sizing: content-box;
		    position: absolute;
		    left: 220px;
		    top: 0;
		    bottom: 0;
		}
	</style>
</head>
<body>
	<div class="" id="wrapper">
	    <tiles:insertAttribute name="sidebar"/>
	    <div class="contentWrap">
		    <div id="page-content-wrapper">
		    	<tiles:insertAttribute name="header"/>       
			    <tiles:insertAttribute name="body" />
		    </div>                                                 
	    	<tiles:insertAttribute name="footer" />
    	</div>
	</div>
</body>
</html>