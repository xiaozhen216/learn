var serviceUrlIncome = Query.get("service") || "../display/json/196";
	
	function queryIncome() {
		var selectedDate = $$("selectedDate").value;
		Ajax({
			url : serviceUrlIncome,
			method : "GET",
			params : {"param1": selectedDate}, 
			type : "json",
			waiting : true,
			ondata : function() {
				var data = eval(this.getResponseText());
				showIncome(data);
			}
		});	  
	}

	
	function showIncome(originData) {
		var total = 0;
		var dataOne = [];
		var dataTwo = [];
		var dataP = [];
		var maxdata = 0;
		var scaledata = 0;
		var cellData = 0;
		for(var i = 0; i < originData.length; i++) {
			var incomeTrans = originData[i]["incomeTrans"];
			var incomeStock = originData[i]["incomeStock"];
			var province = originData[i]["province"];
			if (maxdata<(incomeTrans+incomeStock)) {
				maxdata=(incomeTrans+incomeStock)
			}
			scaledata=Math.floor(maxdata/100000) * 100000 + 100000;

			total += incomeTrans+incomeStock;
			dataOne[i] = Math.round(incomeTrans);
			dataTwo[i] = incomeStock;
			dataP[i] = province;
		}
			total = Math.round(total);
			cellData = scaledata/5

		$(function(){
			var data = [
			{
				name : '中转收入',
				value:dataOne,
				color:'#32bdbc'
			},
			{
			name : '物料收入',
				value:dataTwo,
				color:'#d75a5e'
			}
			];
			var chart = new iChart.ColumnStacked2D({
				render : 'canvasDivIncome',
				data: data,
				labels:dataP,
				title : {
					text:'快运事业部中转费收入及物料收入',
					color:'#dcd6cb',
					textAlign:'left',
					padding:'0 40',
					font:'微软雅黑',
					border:{
					enable:true,
					width:[0,0,4,0],
					color:'#698389'
				},
				height:40
				},
				footnote : {
					text:'当日总收入：￥' + total,
					font:'微软雅黑',
					padding:'0 8',
					color:'#dcd6cb'
				},
				padding:'8 0',
				width : 800,
				height : 400,
				column_width:70,
				gradient : true,//应用背景渐变
				gradient_mode:'LinearGradientDownUp',//渐变类型
				color_factor : 0.1,//渐变因子
				background_color : '#425154',
				sub_option:{
					label:{color:'#f9f9f9',fontsize:12,fontweight:600},
					border : false
				},
				label:{color:'#dcd6cb',font:'微软雅黑',fontsize:12,fontweight:600},
				legend:{
					enable:true,
					background_color : null,
					line_height:25,
					color:'#dcd6cb',
					fontsize:12,
					font:'微软雅黑',
					fontweight:600,
					border : {
						enable : false
					}
				},
				column_width:80,
				coordinate:{
					background_color : 0,
					grid_color:'#888888',
					axis : {
						color : '#c0d0e0',
						width : 0
					},
					scale:[{
						position:'left',
						scale_enable : false,
						start_scale:0,
						scale_space:cellData,
						end_scale:scaledata,
						label:{color:'#dcd6cb',fontsize:11,fontweight:600}
					}],
					width:'92%',
					height:'88%'
				}
				});
				//利用自定义组件构造左上侧单位
				chart.plugin(new iChart.Custom({
				drawFn:function(){
					//计算位置
					var coo = chart.getCoordinate(),
					x = coo.get('originx'),
					y = coo.get('originy');
					//在左上侧的位置，渲染一个单位的文字
					chart.target.textAlign('end')
					.textBaseline('bottom')
					.textFont('600 12px 微软雅黑')
					.fillText('单位(元)',x,y-14,false,'#be5863')
					}
				}));
				chart.draw();
			}); 

		}