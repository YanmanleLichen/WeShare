package com.ws.dao;

import com.ws.po.Blog;
import org.apache.ibatis.annotations.Param;
import com.ws.po.Relation;

import java.util.List;

public interface RelationDao {
    public int focusOnUserByUserId(
            @Param("relation_id") String relation_id,
            @Param("user_id") String user_id,
            @Param("follow_user_id") String follow_user_id,
            @Param("follow_time") String follow_time
    );
    public int unFollowUserByUserId(
            @Param("user_id") String user_id,
            @Param("follow_user_id") String follow_user_id
    );
    public int followOrNot(
            @Param("user_id") String user_id,
            @Param("follow_user_id") String follow_user_id
    );
    public List<Relation> selectRelationsByUserId(
            @Param("user_id") String user_id,
            @Param("start") int start,
            @Param("size") int size
    );
    public int selectRelationsByUserIdCount(
            @Param("user_id") String user_id
    );
    public List<Relation> selectRelationsByFollowUserId(
            @Param("follow_user_id") String follow_user_id,
            @Param("start") int start,
            @Param("size") int size
    );
    public int selectRelationsByFollowUserIdCount(
            @Param("follow_user_id") String follow_user_id
    );
    public List<Blog> selectFollowUserBlogsByUserId(
            @Param("user_id") String user_id,
            @Param("start") int start,
            @Param("size") int size
    );
    public int selectFollowUserBlogsByUserIdCount(
            @Param("user_id") String user_id
    );
}
