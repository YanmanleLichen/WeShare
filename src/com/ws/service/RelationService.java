package com.ws.service;

import com.ws.po.Blog;
import com.ws.po.Relation;

import java.util.List;

public interface RelationService {
    public int focusOnUserByUserId(String relation_id, String user_id, String follow_user_id, String follow_time);
    public int unFollowUserByUserId(String user_id, String follow_user_id);
    public int followOrNot(String user_id, String follow_user_id);
    public List<Relation> selectRelationsByUserId(String user_id, int start, int size);
    public int selectRelationsByUserIdCount(String user_id);
    public List<Relation> selectRelationsByFollowUserId(String follow_user_id, int start, int size);
    public int selectRelationsByFollowUserIdCount(String follow_user_id);
    public List<Blog> selectFollowUserBlogsByUserId(String user_id, int start, int size);
    public int selectFollowUserBlogsByUserIdCount(String user_id);
}
