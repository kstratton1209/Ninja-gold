<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home page</title>
    <link rel="stylesheet" href= "/node_modules/bootstrap/dist/css/bootstrap.min.css" />
</head>
<style>
    .wrapper{
      width:950px;
      height: 1080px;
      margin-left: 20px;
      padding: 20px;
    }
    
    .location {
        border-width: 1px;
        align-items: center;
        display: flex;
    }

    .farm, .cave, .casino, .house {
        border-style: solid;
        width: 28%;
        padding: 20px;
        margin: 20px;
        display: vertical;
        align-content: center;
    }

    #comment_box{
        border-style: solid;
        border-width: 1px;
        width: 100%;
    }

    .header {
        display: flex;
    }
      
	.log {
		max-height: 200px;
		overflow: auto;
	}
	
</style>
<body>
    <div class="wrapper">
        <div class="header">
            <h1>Your Gold: ${total} </h1>
            <h1 id = 'goldCounter'> </h1>
        </div>
    
        <div class="location">
            <div class="farm">
                <h2>Farm</h2>
                <p>(earns 10-20 golds)</p>
                <form action='/process' method='post'>
                        
                    <input type='hidden' name="location" value="farm" >
                    <input type="submit" value = "Find gold!" class="btn btn-primary" style= "margin-top: 20px">
                </form>
            </div>

            <div class="cave">
                <h2>Cave</h2>
                <p>(earns 5-10 golds)</p>
                <form action='/process' method='post'>
                        
                    <input type='hidden' name="location" value="cave" >
                    <input type="submit" value = "Find gold!" class="btn btn-primary" style= "margin-top: 20px">
                </form>
            </div>
            <div class="house">
                <h2>House</h2>
                <p>(earns 2-5 golds)</p>
                <form action='/process' method='post'>
                        
                    <input type='hidden' name="location" value="house" >
                    <input type="submit" value = "Find gold!" class="btn btn-primary" style= "margin-top: 20px">
                </form>
            </div>

            <div class="casino">
                <h2>Casino</h2>
                <p>(earns/takes 0-50 golds)</p>
                <form action='/process' method='post'>
                          
                    <input type='hidden' name="location" value="casino" >
                    <input type="submit" value = "Find gold!" class="btn btn-primary" style= "margin-top: 20px">
                </form>
            </div>

        </div>

                     
        <div class="card mt-3">
            <div class="card-body">
             <p>Activites:</p>
                <div class="log">
                    <c:forEach items="${log}" var="msg">
	                    <c:if test = "${fn:length(msg) > 44}" >
	                        <p style = "color:green">${msg}</p>
	                    </c:if>
	                    <c:if test = "${fn:length(msg) < 43}" >
	                    	<p style = "color:red">${msg}</p>
	                   </c:if>
                    </c:forEach>       
                </div>
            </div>
        </div>
   </div>
</body>
</html>