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
    public Integer checkLogin(String as, String username, String password) {

        Session currentSession = sessionFactory.getCurrentSession();

        String SQL_QUERY = "from " + as + " as o where o.username=:username and o.password=:password";
        Query query = currentSession.createQuery(SQL_QUERY);
        query.setParameter("username", username);
        query.setParameter("password", password);

        List<Student> list = query.list();

        if ((list != null) && (list.size() > 0)) {
            return list.get(0).getId();
        } else {
            return -1;
        }

    }
}
