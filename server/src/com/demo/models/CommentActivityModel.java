package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table comment_activity
//arp.addMapping("comment_activity", CommentActivityModel.class);
public class CommentActivityModel extends Model<CommentActivityModel>{
	public static final CommentActivityModel dao = new CommentActivityModel();
	
	public Page<CommentActivityModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from comment_activity order by create_time asc");
	}
}