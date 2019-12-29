package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table vote_item
//arp.addMapping("vote_item", VoteItemModel.class);
public class VoteItemModel extends Model<VoteItemModel>{
	public static final VoteItemModel dao = new VoteItemModel();
	
	public Page<VoteItemModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from vote_item order by create_time asc");
	}
}