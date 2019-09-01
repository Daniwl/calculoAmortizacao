
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page </title>
    </head>
    <body>
        
            <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
            <h1>Amortização Americana</h1>
        
        
            <form>
                Valor do empréstimo: <input type="number" name="c"/><br><br>
                Número de parcelas mensais: <input type="number" name="n"/><br><br>
                Taxa mensal(%): <input type="text" name="i"/><br><br>
                <input type="submit" name="form" value="Gerar"/><br><br>
            </form>
        <table border="1">
            <tr>
                <td> Número de parcelas </td>
                <td> Saldo devedor </td>
                <td> Amortização </td>
                <td> Juros </td>
                <td> Valor da parcela </td>
            </tr>
            <% DecimalFormat df = new DecimalFormat("R$0.00");
                try{
             double c = Double.parseDouble(request.getParameter("c")); 
             int n = Integer.parseInt(request.getParameter("n")); 
             double i = Double.parseDouble(request.getParameter("i")); 
             i = i/100;
             double juros = i * c;  
             double prestacao = juros; 
             int a;
             for(a = 1; a <= n-1; a++){
            %>    
            <tr>
                <td> <%=a%> </td>
                <td> <%=df.format(c)%> </td>
                <td> - </td>
                <td> <%=df.format(juros)%> </td>
                <td> <%=df.format(juros)%> </td>
                
            </tr>
            <%prestacao += juros;
            } %>
            <tr>
                <td> <%=a%> </td>
                <td> - </td>
                <td> <%=df.format(c)%> </td>
                <td> <%=df.format(juros)%> </td>
                <td> <%=df.format(c+juros)%> </td>
                
            </tr>
            <tr>
                <td> Total </td>
                <td> - </td>
                <td> <%=df.format(c)%> </td>
                <td> <%=df.format(prestacao)%> </td>
                <td> <%=df.format(c+prestacao)%> </td>
                
            </tr>
             
        </table>
            <%
               
            }catch(Exception ex){
                
            } %>
             
           
    </body>
</html>
