package com.demo.common;

import java.util.HashMap;




import java.util.List;
import java.util.Map;

import org.beetl.core.GroupTemplate;
import org.beetl.ext.jfinal3.JFinal3BeetlRenderFactory;

import com.demo.controller.ActivityBillController;
import com.demo.controller.ActivityController;
import com.demo.controller.ActivityMemberController;
import com.demo.controller.ActivityProgressController;
import com.demo.controller.ActivityVotesController;
import com.demo.controller.BaseMenuController;
import com.demo.controller.BaseMessageController;
import com.demo.controller.BaseModuleController;
import com.demo.controller.BaseUserController;
import com.demo.controller.BaseUserTypeController;
import com.demo.controller.CommentActivityController;
import com.demo.controller.CommentVoteController;
import com.demo.controller.ContactController;
import com.demo.controller.IndexController;
import com.demo.controller.UploadController;
import com.demo.controller.VoteController;
import com.demo.controller.VoteItemController;
import com.demo.controller.VoteMemberController;
import com.demo.controller.WechatController;
import com.demo.models.ActivityBillModel;
import com.demo.models.ActivityMemberModel;
import com.demo.models.ActivityModel;
import com.demo.models.ActivityProgressModel;
import com.demo.models.ActivityVotesModel;
import com.demo.models.BaseMenuModel;
import com.demo.models.BaseMessageModel;
import com.demo.models.BaseModuleModel;
import com.demo.models.BaseStateModel;
import com.demo.models.BaseUserModel;
import com.demo.models.BaseUserTypeModel;
import com.demo.models.CommentActivityModel;
import com.demo.models.CommentVoteModel;
import com.demo.models.*;
import com.demo.utils.CrossInterceptor;
import com.demo.utils.DatabaseUtil;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;

public class SystemConfig extends JFinalConfig {
	
	public static final int port = 8888;
	
	
	
	public static void main(String[] args) {
		//PathKit.setWebRootPath("/WebRoot");
		
		JFinal.start("WebRoot", port, "/", 5);
		
	}
	
	public void init(){
		PropKit.use("db_config.txt");
		DatabaseUtil.init();
	}
	
	public void configConstant(Constants me) {
		
		init();
		
		//PropKit.use("db_config.txt");
		me.setDevMode(PropKit.getBoolean("devMode", true));//热更新调试模式
		me.setViewType(ViewType.JSP); 	
		
		JFinal3BeetlRenderFactory rf = new JFinal3BeetlRenderFactory();
		rf.config();
		me.setRenderFactory(rf);
		GroupTemplate gt = rf.groupTemplate;
		Map<String, Object> shard = new HashMap<String, Object>();// 鍏变韩鍙橀噺
		shard.put("ctx", JFinal.me().getContextPath());// 娣诲姞鍏变韩鍙橀噺涓婁笅鏂囪矾锟�?
		gt.setSharedVars(shard);// 璁剧疆鍏变韩鍙橀噺
		me.setMaxPostSize(1200000000);
		
		//me.setBaseUploadPath("/upload"); 
	}
	
	public void configRoute(Routes me) {
		me.add("/", IndexController.class);	
		me.add("/upload", UploadController.class);
		
		me.add("base_menu",BaseMenuController.class);
		me.add("base_message",BaseMessageController.class);
		me.add("base_user",BaseUserController.class);
		me.add("base_user_type",BaseUserTypeController.class);
		
		me.add("activity",ActivityController.class);
		me.add("activity_bill",ActivityBillController.class);
		me.add("activity_member",ActivityMemberController.class);
		me.add("activity_progress",ActivityProgressController.class);
		me.add("activity_votes",ActivityVotesController.class);
		me.add("base_module",BaseModuleController.class);
		me.add("comment_activity",CommentActivityController.class);
		me.add("comment_vote",CommentVoteController.class);
		me.add("vote",VoteController.class);
		me.add("vote_item",VoteItemController.class);
		me.add("vote_member",VoteMemberController.class);
		me.add("contact",ContactController.class);
		
		me.add("wechat",WechatController.class);
		
	}
	 
	public void configPlugin(Plugins me) {
		C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
		me.add(c3p0Plugin);
		
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);
	
//		arp.addMapping("base_user_type", UserTypeModel.class);
//		arp.addMapping("base_menu", MenuModel.class);
//		
		arp.addMapping("base_menu", BaseMenuModel.class);
		arp.addMapping("base_message", BaseMessageModel.class);
		arp.addMapping("base_state", BaseStateModel.class);
		arp.addMapping("base_user", BaseUserModel.class);
		arp.addMapping("base_user_type", BaseUserTypeModel.class);
		
		arp.addMapping("activity", ActivityModel.class);
		arp.addMapping("activity_bill", ActivityBillModel.class);
		arp.addMapping("activity_member", ActivityMemberModel.class);
		arp.addMapping("activity_progress", ActivityProgressModel.class);
		arp.addMapping("activity_votes", ActivityVotesModel.class);
		arp.addMapping("base_module", BaseModuleModel.class);
		arp.addMapping("comment_activity", CommentActivityModel.class);
		arp.addMapping("comment_vote", CommentVoteModel.class);
		arp.addMapping("vote", VoteModel.class);
		arp.addMapping("vote_item", VoteItemModel.class);
		arp.addMapping("vote_member", VoteMemberModel.class);
		arp.addMapping("contact", ContactModel.class);

	}
	
	public void configInterceptor(Interceptors me) {
		me.add(new CrossInterceptor());
	}
	
	public void configHandler(Handlers me) {
		me.add(new ContextPathHandler("ctx"));
	}
	
	

	@Override
	public void configEngine(Engine arg0) {
		// TODO Auto-generated method stub
	}
}
