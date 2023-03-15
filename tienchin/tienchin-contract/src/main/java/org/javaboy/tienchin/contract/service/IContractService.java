package org.javaboy.tienchin.contract.service;

import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.contract.domain.Contract;
import com.baomidou.mybatisplus.extension.service.IService;
import org.javaboy.tienchin.contract.domain.vo.ContractApproveInfo;
import org.javaboy.tienchin.contract.domain.vo.ContractSummary;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author javaboy
 * @since 2023-02-22
 */
public interface IContractService extends IService<Contract> {

    AjaxResult uploadContractFile(HttpServletRequest req, MultipartFile file);

    AjaxResult deleteContractFile(String year, String month, String day, String name);

    AjaxResult addContract(Contract contract);

    AjaxResult geContractInfoPhone(String phone);

    List<ContractSummary> getUnapproveTask();

    AjaxResult getContractById(Integer contractId);

    AjaxResult showContractPDF(String year, String month, String day, String name);

    List<ContractSummary> getCommittedTask();

    AjaxResult approveOrReject(ContractApproveInfo contractApproveInfo);

    List<ContractSummary> approvedTask();

    AjaxResult updateContract(Contract contract);
}
