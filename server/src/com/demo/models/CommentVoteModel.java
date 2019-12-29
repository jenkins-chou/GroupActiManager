package com.demo.models;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

//genarate with database table comment_vote
//arp.addMapping("comment_vote", CommentVoteModel.class);
public class CommentVoteModel extends Model<CommentVoteModel>{
	public static final CommentVoteModel dao = new CommentVoteModel();
	
	public Page<CommentVoteModel> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from comment_vote order by create_time asc");
	}
}