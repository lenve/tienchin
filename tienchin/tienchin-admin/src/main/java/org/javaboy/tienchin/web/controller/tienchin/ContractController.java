package org.javaboy.tienchin.web.controller.tienchin;

import org.javaboy.tienchin.business.service.IBusinessService;
import org.javaboy.tienchin.common.core.controller.BaseController;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.core.page.TableDataInfo;
import org.javaboy.tienchin.contract.domain.Contract;
import org.javaboy.tienchin.contract.domain.vo.ContractApproveInfo;
import org.javaboy.tienchin.contract.domain.vo.ContractSummary;
import org.javaboy.tienchin.contract.service.IContractService;
import org.javaboy.tienchin.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author javaboy
 * @since 2023-02-22
 */
@RestController
@RequestMapping("/tienchin/contract")
public class ContractController extends BaseController {

    @Autowired
    IContractService contractService;

    @Autowired
    ISysUserService sysUserService;

    @Autowired
    IBusinessService businessService;

    @PreAuthorize("hasPermission('tienchin:contract:create')")
    @PostMapping("/upload")
    public AjaxResult uploadContractFile(HttpServletRequest req,MultipartFile file) {
        return contractService.uploadContractFile(req,file);
    }

    @PreAuthorize("hasPermission('tienchin:contract:create')")
    @DeleteMapping("/{year}/{month}/{day}/{name}")
    public AjaxResult deleteContractFile(@PathVariable String year, @PathVariable String month, @PathVariable String day, @PathVariable String name) {
        return contractService.deleteContractFile(year, month, day, name);
    }

    @PreAuthorize("hasPermission('tienchin:contract:create')")
    @PostMapping
    public AjaxResult addContract(@RequestBody Contract contract) {
        return contractService.addContract(contract);
    }

    @PreAuthorize("hasPermission('tienchin:contract:approve')")
    @PutMapping
    public AjaxResult updateContract(@RequestBody Contract contract) {
        return contractService.updateContract(contract);
    }

    @GetMapping("/users/{deptId}")
    @PreAuthorize("hasPermission('tienchin:contract:create')")
    public AjaxResult getUsersByDeptId(@PathVariable Long deptId) {
        return sysUserService.getUsersByDeptId(deptId);
    }

    @GetMapping("/customer/{phone}")
    @PreAuthorize("hasPermission('tienchin:contract:create')")
    public AjaxResult geContractInfoPhone(@PathVariable String phone) {
        return contractService.geContractInfoPhone(phone);
    }

    /**
     * 查询所有待审批的合同
     * @return
     */
    @PreAuthorize("hasPermission('tienchin:contract:list')")
    @GetMapping("/unapprove")
    public TableDataInfo getUnapproveTask() {
        startPage();
        List<ContractSummary> list = contractService.getUnapproveTask();
        return getDataTable(list);
    }
    /**
     * 查询当前用户已经提交但是还未审批的任务列表
     * @return
     */
    @PreAuthorize("hasPermission('tienchin:contract:list')")
    @GetMapping("/committed_task")
    public TableDataInfo getCommittedTask() {
        startPage();
        List<ContractSummary> list = contractService.getCommittedTask();
        return getDataTable(list);
    }

    @PreAuthorize("hasPermission('tienchin:contract:view')")
    @GetMapping("/views/{contractId}")
    public AjaxResult getContractById(@PathVariable Integer contractId) {
        return contractService.getContractById(contractId);
    }


    @PreAuthorize("hasPermission('tienchin:contract:view')")
    @GetMapping("/views/{year}/{month}/{day}/{name}")
    public AjaxResult showContractPDF(@PathVariable String year, @PathVariable String month, @PathVariable String day, @PathVariable String name) {
        return contractService.showContractPDF(year, month, day, name);
    }

    @PreAuthorize("hasPermission('tienchin:contract:approve')")
    @PostMapping("/approve")
    public AjaxResult approveOrReject(@RequestBody ContractApproveInfo contractApproveInfo) {
        return contractService.approveOrReject(contractApproveInfo);
    }

    /**
     * 返回当前登录用户已经提交的并且审批通过的流程
     * @return
     */
    @PreAuthorize("hasPermission('tienchin:contract:list')")
    @GetMapping("/approved")
    public TableDataInfo approvedTask() {
        startPage();
        List<ContractSummary> list = contractService.approvedTask();
        return getDataTable(list);
    }


}
