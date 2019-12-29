package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table base_state
//arp.addMapping("base_state", BaseStateModel.class);
public class BaseStateModel extends Model<BaseStateModel>{
	public static final BaseStateModel dao = new BaseStateModel();
	
	public Page<BaseStateModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from base_state order by create_time asc");
	}
}