package com.buddystore;

import com.buddystore.dto.Test;
import com.buddystore.model.TestDAO;

import java.util.List;

public class test1 {
    public static void main(String[] args) {
        TestDAO dao = new TestDAO();
        List<Test> test = dao.getTestList();


        for (int i =0; i<test.size(); i++ ) {
            System.out.println(test.get(i));
        }
    }
}
