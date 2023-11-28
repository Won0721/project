package kr.kh.letsKo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.letsKo.vo.CompanyFileVO;
import kr.kh.letsKo.vo.CompanyVO;

public interface CompanyService {
	boolean insertCompany(CompanyVO companyVo, MultipartFile[] files2);

	List<CompanyVO> getCompanyList();

	boolean deleteCompany(Integer co_num);

	CompanyVO selectCompany(Integer co_num);

	boolean updateCompany(CompanyVO companyVo, MultipartFile[] file2);

	boolean updateCompanyName(CompanyVO companyVo);

	Object checkName(String co_name);
	
	
	
}