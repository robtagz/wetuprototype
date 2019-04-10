
	var categories = [];   // Option Text|Option Value; 
	categories['LandCruiser'] = ['4x4 LandCruiser|4x4 LandCruise'];

	categories['Selfdrive'] = ['Birthday|Birthday','Christmas|Christmas','Corporate|Corporate'];

	categories['Transfer'] = ['Safari mini van|Safari mini van','Private Transfer|Private Transfer','Shared group Transfer|Shared group Transfer'];

	categories['Flight'] = ['Regional|Regional','Local|Local','International|International'];


 // the "names" of the dynamic lists, as they occur in the form;

	categories['Birthday'] = ['Disney|DisneyValue','Pirates|PriatesValue','Princess|PrinessValue','Ballet|BalletValue','Magic|MagicValue','Surfer|SurferValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\'s|50\'sValue','Rock & Roll|RRValue','Horses|HorsesValue','Zoo|ZooValue'];

	categories['Christmas'] = ['Magic|MagicValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\s|50\'sValue'];

	categories['Corporate'] = ['Magic|MagicValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\s|50\'sValue','Rock & Roll|RRValue'];

 // take note of landcruiser below and the option value above
    categories['4x4 LandCruiser'] = ['Disney|DisneyValue','Pirates|PriatesValue','Princess|PrinessValue','Ballet|BalletValue','Magic|MagicValue'];

	categories['Safari mini van'] = ['Magic|MagicValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\s|50\'sValue'];

	categories['Private Transfer'] = ['Magic|MagicValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\s|50\'sValue','Rock & Roll|RRValue'];

	categories['Shared group Transfer'] = ['Magic|MagicValue','Hawaiian|HawaiianValue','50\'s 60\'s 70\s|50\'sValue','Rock & Roll|RRValue'];


	categories['Regional'] = ['Kenya Airways','AirKenya','Mombasa Air','Safarilink','Precision Air'];

	categories['Local'] = ['Kenya Airways','Precision Air','Coastal Aviation','Air Excel'];

	categories['International'] = ['Kenya Airways'];





	var dynList = ['partyType','theme'];  // the "names" of the dynamic lists, as they occur in the form;

	function fillSelect(currCat,currList,step){

		for (i=step; i<dynList.length; i++)
			{
			 document.forms[0][dynList[i]].length = 1;
			 document.forms[0][dynList[i]].selectedIndex = 0;
			}
		var nCategory = categories[currCat];
		for (each in nCategory)
			{
			 var nOption = document.createElement('option'); 
			 var nInfo = nCategory[each].split("|");
			 nOption.setAttribute('value',nInfo[1]); 
			 nOption.appendChild(document.createTextNode(nInfo[0])); 
			 currList.appendChild(nOption); 
			} 
	}
	
