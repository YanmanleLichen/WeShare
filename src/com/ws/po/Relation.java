package com.ws.po;

public class Relation {
    private String relation_id;
    private String user_id;
    private String follow_user_id;
    private String follow_time;

    public Relation() {
        super();
    }

    public Relation(String relation_id, String user_id, String follow_user_id, String follow_time) {
        super();
        this.relation_id = relation_id;
        this.user_id = user_id;
        this.follow_user_id = follow_user_id;
        this.follow_time = follow_time;
    }

    @Override
    public String toString() {
        return "Relation{" +
                "relation_id='" + relation_id + '\'' +
                ", user_id='" + user_id + '\'' +
                ", follow_user_id='" + follow_user_id + '\'' +
                ", follow_time='" + follow_time + '\'' +
                '}';
    }

    public String getRelation_id() {
        return relation_id;
    }

    public void setRelation_id(String relation_id) {
        this.relation_id = relation_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getFollow_user_id() {
        return follow_user_id;
    }

    public void setFollow_user_id(String follow_user_id) {
        this.follow_user_id = follow_user_id;
    }

    public String getFollow_time() {
        return follow_time;
    }

    public void setFollow_time(String follow_time) {
        this.follow_time = follow_time;
    }
}
