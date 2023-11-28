package kr.kh.letsKo.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.letsKo.dao.CompanyDAO;
import kr.kh.letsKo.util.UploadFileUtils;
import kr.kh.letsKo.vo.CompanyFileVO;
import kr.kh.letsKo.vo.CompanyVO;

@Service
public class CompanyServiceImp implements CompanyService{
	@Autowired
	CompanyDAO companyDAO;
	
	String uploadPath = "C:\\uploadFiles";
	String uploadCompanyFilePath = uploadPath + "\\companyFiles";
	String uploadBoardFilePath = uploadPath + "\\boardFiles";
	
	// 고속사 등록
		@Override
		public boolean insertCompany(CompanyVO companyVo, MultipartFile[] files) {
			if(companyVo == null || companyVo.getCo_name() == null) {
				return false;
			}
			companyDAO.insertCompany(companyVo);
			//첨부파일을 업로드
			if(files == null || files.length == 0) {
				return false;
			}
			
			//첨부파일을 서버에 업로드 하고, DB에 저장
			uploadFileAndInsert(files, companyVo.getCo_num());	
			return true;
		}

		// 첨부파일 등록 메서드
		private void uploadFileAndInsert(MultipartFile[] files, int co_num) {
			if(files == null || files.length == 0) {
				System.out.println("[uploadFileAndInsert] 실패");
				return;
			}
			for(MultipartFile file : files) {
				if(file == null || file.getOriginalFilename().length() == 0) {
					continue;
				}
				try {
					String cf_name = UploadFileUtils.uploadFile(uploadCompanyFilePath, file.getOriginalFilename(), file.getBytes());
					CompanyFileVO CompanyfileVo = new CompanyFileVO(co_num, cf_name, file.getOriginalFilename());
					companyDAO.insertFile(CompanyfileVo);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		// 등록된 고속사 가져오는 메서드
		@Override
		public List<CompanyVO> getCompanyList() {
			
			return companyDAO.selectCompanyList();
		}
		// 고속사 삭제
		@Override
		public boolean deleteCompany(Integer co_num) {
			
			if(companyDAO.selectCompanyFile(co_num) != null) {
				deleteCompanyFile(co_num);
			}
			companyDAO.deleteBusByCompany(co_num);
			companyDAO.deleteCompany(co_num);

			return true;
		}
		
		// 로고 파일삭제
		public void deleteCompanyFile(Integer co_num) {
			CompanyFileVO companyFile =	companyDAO.selectCompanyFile(co_num);
			String cf_name = companyFile.getCf_name();
			
			companyDAO.deleteCompanyFile(co_num);
			UploadFileUtils.deleteFile(uploadPath, cf_name);	
		}
		
		// 고속사 선택
		@Override
		public CompanyVO selectCompany(Integer co_num) {
			
			return companyDAO.selectCompany(co_num);
		}
		
		// 고속사 첨부파일 포함 수정
		@Override
		public boolean updateCompany(CompanyVO companyVo, MultipartFile[] files) {
			
			if(companyVo == null || companyVo.getCo_name() == null) {
				return false;
			}
			//첨부파일을 업로드
			if(files == null || files.length == 0) {
				return false;
			}
			
			if(companyDAO.selectCompanyFile(companyVo.getCo_num()) != null) {
				
				deleteCompanyFile(companyVo.getCo_num());
			}
			//첨부파일을 서버에 업로드 하고, DB에 저장
			companyDAO.updateCompany(companyVo);		
			uploadFileAndInsert(files, companyVo.getCo_num());	
			return true;
		}
		
		// 고속사 첨부파일 없을때 
		@Override
		public boolean updateCompanyName(CompanyVO companyVo) {
			companyDAO.updateCompanyName(companyVo);
			return true;
			
		}

		@Override
		public Object checkName(String co_name) {
			// TODO Auto-generated method stub
			return companyDAO.selectCompanyByName(co_name) == null;
		}
}
