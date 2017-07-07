/**
 * 
 */

	function getList(){
		$.ajax({
			url:"getMemoList",
			type:"GET",
			success:function(data){
				var result="";
				result+="<table>";
				$(data).each(function(){
					result+="<tr>";
					result+="<td>"+this.num+"</td>";
					result+="<td>"+this.content+"</td>";
					result+="<td>"+this.writer+"</td>";
					result+="<td>"+this.date+"</td>";
					result+="</tr>";
				});
				result+="</table>";
				$("#result").html(result);
			}
		});
	}
	function memoWrite(content, writer){
		$.ajax({
			url:"memoWrite",
			type:"POST",
			data:{
				content:content,
				writer:writer
			},
			success:function(data){
				getList();
			}
		})
	}
	function memoView(num){
		$.get("memoView/"+num, function(data){
			var result="";
			result+="<table>";
			result+="<tr>";
			result+="<td>"+data.num+"</td>";
			result+="<td>"+data.content+"</td>";
			result+="<td>"+data.writer+"</td>";
			result+="<td>"+data.date+"</td>";
			result+="</tr>";
			result+="</table>";
			$("#result2").html(result);
		});
	}