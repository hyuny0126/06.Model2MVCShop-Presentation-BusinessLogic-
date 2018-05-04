<%@ page contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%System.out.println("��ǰ��Ϥ� jsp ���� :: ");%>

<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();		
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/listProduct.do?menu=manage" method="post">

	<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
		<tr>
			<td width="15" height="37">
				<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
			</td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">
						
								��ǰ ����
						
						</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37">
				<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
			</td>
		</tr>
	</table>
	
	<!-- �˻� �ɼ� ���� -->
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
			<!-- ������� ���� �ƴϸ� if �� ���� -->
			<c:if test="${! empty search.searchCondition}">
				<td align="right">
					<select name="searchCondition" class="ct_input_g" style="width:80px">
						<c:choose>
							<c:when test="${search.searchCondition==0}">
								<option value="0" selected>��ǰ��ȣ</option>
								<option value="1">��ǰ��</option>
								<option value="2">��ǰ����</option>
							</c:when>
							<c:when test="${search.searchCondition==1}">
								<option value="0">��ǰ��ȣ</option>
								<option value="1" selected>��ǰ��</option>
								<option value="2">��ǰ����</option>
							</c:when>	
							<c:when test="${search.searchCondition==2}">
								<option value="0">��ǰ��ȣ</option>
								<option value="1">��ǰ��</option>
								<option value="2"selected>��ǰ����</option>
							</c:when>	
						</c:choose>
					</select>
					<input 	type="text" name="searchKeyword"  value="${search.searchKeyword}" 
						class="ct_input_g" style="width:200px; height:19px" >
				</td>
			</c:if>
			<!-- ������� ���� �ƴϸ� if �� �� -->
			
			<!-- ������� ���̸� if �� ���� -->
			<c:if test="${empty search.searchCondition}">
				<td align="right">
					<select name="searchCondition" class="ct_input_g" style="width:80px">
						<option value="0" selected>��ǰ��ȣ</option>
						<option value="1">��ǰ��</option>
						<option value="2">��ǰ����</option>
					</select>
					<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" >
				</td>
			
			</c:if> 
			<!-- ������� ���̸� if �� �� -->
			
			<td align="right" width="70">
			<!-- �˻� -->
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
						</td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
							<a href="javascript:fncList('1');">�˻�</a>
						</td>
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
						</td>
					</tr>
				</table>
			<!-- �˻�   ��-->	
			</td>
		</tr>
	</table>
	
	<!-- �˻� �ɼ�  ��-->
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td colspan="11" >
				��ü  ${resultPage.totalCount } �Ǽ�, ����  ${resultPage.currentPage} ������
			</td> 
		</tr> 
		<tr>
			<td class="ct_list_b" width="100">No</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">��ǰ��</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">����</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">�����</td>	
			<td class="ct_line02"></td>
			<td class="ct_list_b">�������</td>	
		</tr>
		<tr>
			<td colspan="11" bgcolor="808285" height="1"></td>
		</tr>
		
	<!-- for�� ���鼭 list ������ ��ŭ ���� -->	
	<c:set var="i" value="0" />
		<c:forEach var = "product" items="${list}">
				<c:set var ="i" value ="${i+1}"/>
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
				<td></td>
					<c:choose>
						<c:when test="${product.proTranCode=='0'}">
							<td align="left"><a href="/updateProductView.do?prodNo=${product.prodNo}&menu=manage">${product.prodName}</a></td>
						</c:when>	
						<c:otherwise>
							<td align="left">${product.prodName}</td>
						</c:otherwise>
					</c:choose>
					
				<td></td>
				<td align="left">${product.price}</td>
				<td></td>
				<td align="left">${product.manuDate}</td>
				<td></td>
				<td align="left">
					
				<!-- ������� �׸�(����ڵ忡 ����)  -->	
				<c:choose>
					<c:when test="${product.proTranCode=='0'}">�Ǹ��� </c:when>
					 <c:when test="${product.proTranCode=='1'}">���ſϷ�  
					 	<a href="/updateTranCodeByProd.do?prodNo=${product.prodNo}&tranCode=2&menu=manage">����ϱ� </a>
					 </c:when>
					 <c:when test="${product.proTranCode=='2'}">�����  </c:when>
					 <c:when test="${product.proTranCode=='-1'}">��ǰ ��û ���� 
					 	<a href="/updateTranCodeByProd.do?prodNo=${product.prodNo}&tranCode=-2&menu=manage">��ǰ���� </a>
					 	<a href="/updateTranCodeByProd.do?prodNo=${product.prodNo}&tranCode=-3&menu=manage">��ǰ���� </a> </c:when>
					 <c:when test="${product.proTranCode=='-2'}">��ǰ��û ���ͼ� ������ (��ǰó���� �Ϸ��)</c:when>
					 <c:when test="${product.proTranCode=='-3'}">��ǰ��û ���ͼ� ������ (������ ��۵Ǿ��� ��ǰ��û������ ������)</c:when>
			  		<c:otherwise> ��ۿϷ�</c:otherwise>	
				</c:choose>
		</tr>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>	
		
		</c:forEach>	
		
	</table>
	
	
	<!-- ������ ó�� -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
		<tr>
			<td align="center">
			   <input type="hidden" id="currentPage" name="currentPage" value=""/>
				<jsp:include page="../common/pageNavigator.jsp"/>	
	    	</td>
		</tr>
	</table>
	<!--  ������ Navigator �� -->
</form>

</div>
</body>
</html>