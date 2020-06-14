package com.wwb.o2o.service;

import java.util.List;

import com.wwb.o2o.entity.Area;

public interface AreaService {
	public static final String AREALISTKEY = "arealist";

	/**
	 * 获取区域列表，优先从缓存获取
	 * 
	 * @return
	 */
	public List<Area> getAreaList();
}
