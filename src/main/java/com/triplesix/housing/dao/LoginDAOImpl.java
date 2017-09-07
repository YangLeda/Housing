package com.triplesix.housing.dao;


import com.triplesix.housing.entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
public class LoginDAOImpl implements LoginDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public boolean checkLogin(String username, String password) {

        Session currentSession = sessionFactory.getCurrentSession();

        String SQL_QUERY = "from Student as o where o.username=? and o.password=?";
        Query<Student> query = currentSession.createQuery(SQL_QUERY, Student.class);
        query.setParameter(0, username);
        query.setParameter(1, password);

        List<Student> list = query.list();

        return (list != null) && (list.size() > 0);
    }

}
