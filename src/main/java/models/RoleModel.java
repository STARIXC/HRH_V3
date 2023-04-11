/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author UTJ
 */
public class RoleModel {
    int id;
    String role_name;

    public RoleModel() {
    }

    public RoleModel(int id, String role_name) {
        this.id = id;
        this.role_name = role_name;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    @Override
    public String toString() {
        return "RoleModel{" + "id=" + id + ", role_name=" + role_name + '}';
    }
    
}
