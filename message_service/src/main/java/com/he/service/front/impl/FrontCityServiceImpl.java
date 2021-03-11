package com.he.service.front.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.he.dao.front.FrontCityDao;
import com.he.dao.front.FrontLeaderNameDao;
import com.he.service.front.FrontCityService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @Author: heboxuan
 * @Date: Created in 20:21 2021/3/3
 */
@Service
public class FrontCityServiceImpl implements FrontCityService {
    @Autowired
    private FrontCityDao frontCityDao;

    @Autowired
    private FrontLeaderNameDao frontLeaderNameDao;

    @Override
    public Map<String, Object> totalMessageOne() {
        Map<String, Object> beijingTotal=frontCityDao.totalMessageOne();
        return beijingTotal;
    }

    @Override
    public List<Map<String,Object>> totalMessageTwo() {
        List<Map<String,Object>> countyTotal=frontCityDao.totalMessageTwo();
        return countyTotal;
    }

    @Override
    public Map<String, Object> totalMessageThree(Long id) {
        Map<String, Object> countyDetail=frontCityDao.totalMessageThree(id);
        return countyDetail;
    }

    @Override
    public Map<String, Object> totalMessageFour() {
        Map<String, Object> beijingLeaderOne=frontLeaderNameDao.totalMessageFour();
        return beijingLeaderOne;
    }

    @Override
    public Map<String, Object> totalMessageFive() {
        Map<String, Object> beijingLeaderTwo=frontLeaderNameDao.totalMessageFive();
        return beijingLeaderTwo;
    }

    @Override
    public Map<String, Object> totalMessageSix(Long id) {
        Map<String, Object> countyLeaderOne=frontLeaderNameDao.totalMessageSix(id);
        return countyLeaderOne;
    }

    @Override
    public Map<String, Object> totalMessageSeven(Long id) {
        Map<String, Object> countyLeaderTwo=frontLeaderNameDao.totalMessageSeven(id);
        return countyLeaderTwo;
    }
}
