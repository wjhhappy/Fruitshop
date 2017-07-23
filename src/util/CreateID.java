package util;

import java.text.SimpleDateFormat;
import java.util.Date;

//主键产生器
public class CreateID {
  public static String getStringID(){
	String id=null;
	Date date=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSS");
	id=sdf.format(date);
	return id;	
  	}
}
