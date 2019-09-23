public void getBackDate(Map<String,Set<String>> map,Map<String,Set<String>> resultData){
		String key=null;
		String value=null;
		String parentkey=null;
		Set<String> set=new HashSet<String>();
		for(Entry<String, Set<String>> vo1:map.entrySet()){
	
			key=vo1.getKey();
			if(vo1.getValue().size()==1&&key.contains(".")){
				value=vo1.getValue().iterator().next();
				while(true){
				 parentkey=key.substring(0, key.lastIndexOf("."));
	    		  if(null!=resultData.get(parentkey)&&resultData.get(parentkey).size()==1){
	    			  set.add(key);
	    			  key=parentkey;
	    		  }else if(null!=resultData.get(parentkey)&&resultData.get(parentkey).size()>1){
	    			  if(null!=resultData.get(value)){
	    				  
	    			  }else{
	    				  	resultData.get(parentkey).remove(key);
			    			 set.add(key);
			    			 resultData.get(parentkey).add(value);
	    			  }
	    		     
	    			 break;
	    		  }
			}	
		 }
		}
		if(!set.isEmpty()){
			for(String d:set){
				resultData.remove(d);
			}
		}
	}
