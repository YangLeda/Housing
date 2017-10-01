package com.triplesix.housing.dao;

import com.triplesix.housing.entity.Img;

import java.util.List;

public interface ImgDAO {
    List<Img> getImgsByHouseId(Integer houseid);

    void addImg(String path, Integer houseid);
}
