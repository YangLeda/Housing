package com.triplesix.housing.dao;

import com.triplesix.housing.entity.Img;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class ImgDAOImpl implements ImgDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Img> getImgsByHouseId(Integer houseid) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Img> q = currentSession.createQuery("Select i from Img i where i.houseid=:houseid", Img.class);
        q.setParameter("houseid", houseid);
        List<Img> imgs = q.getResultList();

        return imgs;
    }

    @Override
    @Transactional
    public void addImg(String path, Integer houseid) {
        Img img = new Img(path, houseid);
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.persist(img);
    }
}
