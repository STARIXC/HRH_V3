/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author UTJ
 */
public class Common__ {
    int id;
    String name;
    String desc__;
    String created;

    public Common__() {
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc__() {
        return desc__;
    }

    public void setDesc__(String desc__) {
        this.desc__ = desc__;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    public Common__(int id, String name, String desc__, String created) {
        this.id = id;
        this.name = name;
        this.desc__ = desc__;
        this.created = created;
    }

    public Common__(String name, String desc__, String created) {
        this.name = name;
        this.desc__ = desc__;
        this.created = created;
    }
    
    
}
