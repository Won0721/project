package kr.kh.letsKo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.letsKo.vo.CompanyFileVO;
import kr.kh.letsKo.vo.CompanyVO;

public interface CompanyDAO {
	void insertFile(@Param("companyfile") CompanyFileVO companyfileVo);

	void insertCompany(@Param("company") CompanyVO companyVo);
	
	List<CompanyVO> selectCompanyList();
	
	boolean deleteCompany(@Param("co_num") Integer co_num);

	void deleteCompanyFile(@Param("cf_co_num") Integer cf_co_num);
	
	CompanyFileVO selectCompanyFile(@Param("cf_co_num") Integer cf_co_num);

	CompanyVO selectCompany(@Param("co_num") Integer co_num);
	
	void updateCompany(@Param("company") CompanyVO companyVo);
	
	boolean deleteBusByCompany(@Param("bus_co_num") Integer bus_co_num);

	void updateCompanyName(@Param("company") CompanyVO companyVo);

	Object selectCompanyByName(@Param("co_name") String co_name);

	
}