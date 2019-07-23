package com.demo.mms.common.utils;

import com.demo.mms.common.domain.Buyer;

import java.util.*;

public class ProjectTest {
    //供测试使用，不是程序入口
    public static void main(String[] args){
        class A {
            private double r;
            private double g;
            private double b;

            private A(double r, double g, double b) {
                this.r = r;
                this.g = g;
                this.b = b;
            }
        }

        Collection<Object> objs = Arrays.asList(new A[]{new A(1, 2, 3), new A(2, 3, 4)});
        Collection<A> As = Arrays.asList((A[]) objs.toArray());
    }
}
