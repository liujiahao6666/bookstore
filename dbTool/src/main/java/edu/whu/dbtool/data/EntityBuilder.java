package edu.whu.dbtool.data;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.HashMap;
import java.util.Map;

public class EntityBuilder<T> {

    private Class<T> clazz;

    public EntityBuilder() {
        this.clazz = (Class<T>)((ParameterizedType)(getClass().getGenericSuperclass())).getActualTypeArguments()[0];
    }

    public T build(Map data) {
        try {
            Field[] fields = clazz.getDeclaredFields();
            Object newInstance = clazz.newInstance();
            for (Field field : fields) {
                field.setAccessible(true);
                String name = field.getName();
                Class<?> type = field.getType();
                if(data.get(name) == null) continue;
                if(type == String.class){
                    field.set(newInstance,(String)data.get(name));
                } else if(type.getName().equals("float")){
                    field.set(newInstance,Float.parseFloat(data.get(name).toString()));
                } else if(type.getName().equals("boolean")){
                    field.set(newInstance,Boolean.parseBoolean(data.get(name).toString()));
                } else if(type.getName().equals("int")){
                    field.set(newInstance,Integer.parseInt(data.get(name).toString()));
                }
            }
            return (T)newInstance;
        } catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args){
        Map mp = new HashMap<>();
        mp.put("account","123456");
        mp.put("name","zangsan");
        mp.put("money","123");
        mp.put("isChanged","true");
        user u = new userBuilder().build(mp);
        System.out.println(u);

        Map mp2 = new HashMap();
        mp2.put("id",123);
        order o = new orderBuilder().build(mp2);
        System.out.println(o);
    }
}
