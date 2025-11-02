package com.bwell.base.content.model;

import com.bwell.utils.IdGenerator;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonGetter;
import lombok.Data;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
public class ItemCell implements Serializable {
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private long id;

    @Column(name = "index")
    private int order;

    
    @Column( length = 10000, columnDefinition = "TEXT")
    private String value;


    public long getId() {
        if (id == 0L){
            setId(IdGenerator.nextId());
        }
        return id;
    }
    @JsonGetter("order")
    public int getOrder() {
        return order;
    }
    @JsonGetter("order")
    public void setOrder(int order) {
        this.order = order;
    }
}
