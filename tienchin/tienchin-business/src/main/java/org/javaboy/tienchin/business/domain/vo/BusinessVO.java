package org.javaboy.tienchin.business.domain.vo;

import org.javaboy.tienchin.common.core.domain.BaseEntity;

public class BusinessVO extends BaseEntity {
    private String name;
    private String phone;
    private String owner;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }
}
