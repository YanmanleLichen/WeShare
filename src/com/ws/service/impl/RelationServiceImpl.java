package com.ws.service.impl;

import com.ws.po.Blog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ws.dao.RelationDao;
import com.ws.po.Relation;
import com.ws.service.RelationService;

import java.util.List;

@Service("relationService")
@Transactional
public class RelationServiceImpl implements RelationService {
    @Autowired
    private RelationDao relationDao;
    @Override
    public int focusOnUserByUserId(String relation_id, String user_id, String follow_user_id, String follow_time) {
        int ret = this.relationDao.focusOnUserByUserId(relation_id, user_id,follow_user_id, follow_time);
        return ret;
    }

    @Override
    public int unFollowUserByUserId(String user_id, String follow_user_id) {
        int ret = this.relationDao.unFollowUserByUserId(user_id, follow_user_id);
        return ret;
    }

    @Override
    public int followOrNot(String user_id, String follow_user_id) {
        int ret = this.relationDao.followOrNot(user_id, follow_user_id);
        return ret;
    }

    @Override
    public List<Relation> selectRelationsByUserId(String user_id, int start, int size) {
        List<Relation> relations = this.relationDao.selectRelationsByUserId(user_id, start, size);
        return relations;
    }

    @Override
    public int selectRelationsByUserIdCount(String user_id) {
        int ret = this.relationDao.selectRelationsByUserIdCount(user_id);
        return  ret;
    }

    @Override
    public List<Relation> selectRelationsByFollowUserId(String follow_user_id, int start, int size) {
        List<Relation> relations = this.relationDao.selectRelationsByFollowUserId(follow_user_id, start, size);
        return relations;
    }

    @Override
    public int selectRelationsByFollowUserIdCount(String follow_user_id) {
        int ret = this.relationDao.selectRelationsByFollowUserIdCount(follow_user_id);
        return ret;
    }

    @Override
    public List<Blog> selectFollowUserBlogsByUserId(String user_id, int start, int size) {
        List<Blog> blogs = this.relationDao.selectFollowUserBlogsByUserId(user_id, start, size);
        return blogs;
    }

    @Override
    public int selectFollowUserBlogsByUserIdCount(String user_id) {
        int ret = this.relationDao.selectFollowUserBlogsByUserIdCount(user_id);
        return ret;
    }
}
