package org.javaboy.tienchin.contract.service.impl;

import com.aspose.words.Document;
import com.aspose.words.PdfCompliance;
import com.aspose.words.PdfSaveOptions;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.task.api.Task;
import org.flowable.variable.api.history.HistoricVariableInstance;
import org.javaboy.tienchin.business.domain.Business;
import org.javaboy.tienchin.business.service.IBusinessService;
import org.javaboy.tienchin.common.constant.TienChinConstants;
import org.javaboy.tienchin.common.core.domain.AjaxResult;
import org.javaboy.tienchin.common.core.domain.UploadFileResp;
import org.javaboy.tienchin.common.utils.SecurityUtils;
import org.javaboy.tienchin.common.utils.sign.Base64;
import org.javaboy.tienchin.contract.domain.Contract;
import org.javaboy.tienchin.contract.domain.vo.ContractApproveInfo;
import org.javaboy.tienchin.contract.domain.vo.ContractInfo;
import org.javaboy.tienchin.contract.domain.vo.ContractSummary;
import org.javaboy.tienchin.contract.mapper.ContractMapper;
import org.javaboy.tienchin.contract.service.IContractService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.javaboy.tienchin.course.domain.Course;
import org.javaboy.tienchin.course.service.ICourseService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author javaboy
 * @since 2023-02-22
 */
@Service
public class ContractServiceImpl extends ServiceImpl<ContractMapper, Contract> implements IContractService {
    @Autowired
    IBusinessService businessService;
    @Autowired
    ICourseService courseService;
    @Autowired
    ContractMapper contractMapper;

    @Autowired
    RuntimeService runtimeService;

    @Autowired
    TaskService taskService;

    @Autowired
    HistoryService historyService;

    @Value("${tienchin.contract.file}")
    String contractFolder;

    SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");

    @Override
    public AjaxResult uploadContractFile(HttpServletRequest req, MultipartFile file) {
        String format = sdf.format(new Date());
        String fileDir = contractFolder + format;
        File dir = new File(fileDir);
        if (!dir.exists()) {
            //如果文件夹不存在，那么就将文件夹创建出来
            dir.mkdirs();
        }
        //获取原始文件名
        String originalFilename = file.getOriginalFilename();
        //新的文件名
        String newName = UUID.randomUUID().toString() + "-" + originalFilename;
        try {
            file.transferTo(new File(dir, newName));
            String url = req.getScheme() + "://"
                    + req.getServerName() + ":"
                    + req.getServerPort()
                    + req.getContextPath()
                    + "/tienchin/contract/views"
                    + format + newName;
            UploadFileResp resp = new UploadFileResp();
            resp.setName(originalFilename);
            resp.setUrl(url);
            return AjaxResult.success(resp);
        } catch (IOException e) {
//            throw new RuntimeException(e);
        }
        return AjaxResult.error("文件上传失败");
    }

    @Override
    public AjaxResult deleteContractFile(String year, String month, String day, String name) {
        String fileName = contractFolder + File.separator + year + File.separator + month + File.separator + day + File.separator + name;
        File file = new File(fileName);
        boolean delete = file.delete();
        return delete ? AjaxResult.success("删除成功") : AjaxResult.error("删除失败");
    }

    @Transactional
    @Override
    public AjaxResult addContract(Contract contract) {
        //1. 向合同表中添加数据
        //1.1 查询商机 ID 并设置
        QueryWrapper<Business> qw = new QueryWrapper<>();
        qw.lambda().eq(Business::getPhone, contract.getPhone()).orderByDesc(Business::getCreateTime);
        List<Business> list = businessService.list(qw);
        Integer businessId = list.get(0).getBusinessId();
        contract.setBusinessId(businessId);
        //1.2 查询课程价格并设置
        QueryWrapper<Course> cqw = new QueryWrapper<>();
        cqw.lambda().eq(Course::getCourseId, contract.getCourseId());
        Course c = courseService.getOne(cqw);
        contract.setCoursePrice(c.getPrice());
        //1.3 设置通用属性
        contract.setCreateBy(SecurityUtils.getUsername());
        contract.setCreateTime(LocalDateTime.now());
        contract.setDelFlag(0);
        contract.setStatus(TienChinConstants.CONTRACT_UNAPPROVE);
        save(contract);
        //2。 启动流程
        //启动流程
        Map<String, Object> pivars = new HashMap<>();
        pivars.put("currentUser", SecurityUtils.getUsername());
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(TienChinConstants.CONTRACT_PROCESS_DEFINITION_ID, pivars);
        Map<String, Object> vars = new HashMap<>();
        vars.put("contractId", contract.getContractId());
        vars.put("approveUser", contract.getApproveUserName());
        vars.put("approveUserId", contract.getApproveUserId());
        Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).singleResult();
        taskService.complete(task.getId(), vars);
        //3。更新合同信息
        contract.setProcessInstanceId(processInstance.getProcessInstanceId());
        updateById(contract);
        return AjaxResult.success("提交成功");
    }

    @Override
    public AjaxResult geContractInfoPhone(String phone) {
        List<ContractInfo> list = contractMapper.geContractInfoPhone(phone);
        if (list != null && list.size() > 0) {
            ContractInfo contractInfo = list.get(0);
            return AjaxResult.success(contractInfo);
        } else {
            return AjaxResult.error("手机号码输入错误，客户不存在");
        }
    }

    @Override
    public List<ContractSummary> getUnapproveTask() {
        List<ContractSummary> result = new ArrayList<>();
        //查询当前用户需要处理的任务
        List<Task> list = taskService.createTaskQuery().taskAssignee(SecurityUtils.getUsername())
                .processDefinitionKey(TienChinConstants.CONTRACT_PROCESS_DEFINITION_ID)
                .active().orderByTaskCreateTime().desc().list();
        for (Task task : list) {
            String taskId = task.getId();
            Integer contractId = (Integer) taskService.getVariable(task.getId(), "contractId");
            String reason = (String) taskService.getVariable(task.getId(), "reason");
            ContractSummary summary = new ContractSummary();
            Contract contract = getById(contractId);
            BeanUtils.copyProperties(contract, summary);
            summary.setTaskId(taskId);
            summary.setReason(reason);
            result.add(summary);
        }
        return result;
    }

    @Override
    public AjaxResult getContractById(Integer contractId) {
        Contract contract = getById(contractId);
        return AjaxResult.success(contract);
    }

    @Override
    public AjaxResult showContractPDF(String year, String month, String day, String name) {
        try {
            //word 的文件完整路径
            String docFilePath = contractFolder + File.separator + year + File.separator + month + File.separator + day + File.separator + name;
            String pdfFilePath = docFilePath.replace(".docx", ".pdf").replace(".doc", ".pdf");
            File pdfFile = new File(pdfFilePath);
            if (!pdfFile.exists()) {
                Document doc = new Document(docFilePath);
                PdfSaveOptions options = new PdfSaveOptions();
                options.setCompliance(PdfCompliance.PDF_17);
                doc.save(pdfFilePath, options);
            }
            FileInputStream fis = new FileInputStream(pdfFilePath);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            int len = 0;
            byte[] buf = new byte[1024];
            while ((len = fis.read(buf)) != -1) {
                baos.write(buf, 0, len);
            }
            return AjaxResult.success(Base64.encode(baos.toByteArray()));
        } catch (Exception e) {
//            throw new RuntimeException(e);
            return AjaxResult.error("未加载到 PDF 文件:" + e.getMessage());
        }
    }

    @Override
    public List<ContractSummary> getCommittedTask() {
        List<ContractSummary> result = new ArrayList<>();
        //查询当前用户已经提交的任务
        List<Execution> list = runtimeService.createExecutionQuery().variableValueEquals("currentUser", SecurityUtils.getUsername()).processDefinitionKey(TienChinConstants.CONTRACT_PROCESS_DEFINITION_ID).list();
        for (Execution e : list) {
            String eId = e.getId();
            Integer contractId = (Integer) runtimeService.getVariable(e.getId(), "contractId");
            String reason = (String) runtimeService.getVariable(e.getId(), "reason");
            ContractSummary summary = new ContractSummary();
            Contract contract = getById(contractId);
            BeanUtils.copyProperties(contract, summary);
            summary.setTaskId(eId);
            summary.setReason(reason);
            result.add(summary);
        }
        return result;
    }

    @Override
    public AjaxResult approveOrReject(ContractApproveInfo contractApproveInfo) {
        //流程审批
        Map<String, Object> vars = new HashMap<>();
        vars.put("approve", contractApproveInfo.getApprove());
        vars.put("reason", contractApproveInfo.getReason());
        taskService.complete(contractApproveInfo.getTaskId(), vars);
        //修改合同表中关于这条合同记录的状态
        UpdateWrapper<Contract> uw = new UpdateWrapper<>();
        if (contractApproveInfo.getApprove()) {
            uw.lambda().set(Contract::getStatus, TienChinConstants.CONTRACT_APPROVED).eq(Contract::getContractId, contractApproveInfo.getContractId());
        } else {
            uw.lambda().set(Contract::getStatus, TienChinConstants.CONTRACT_REJECT).eq(Contract::getContractId, contractApproveInfo.getContractId());
        }
        update(uw);
        return AjaxResult.success("审批完成");
    }

    @Override
    public List<ContractSummary> approvedTask() {
        List<ContractSummary> result = new ArrayList<>();
        List<HistoricProcessInstance> list = historyService.createHistoricProcessInstanceQuery().variableValueEquals("currentUser", SecurityUtils.getUsername()).finished().list();
        for (HistoricProcessInstance hpi : list) {
            List<HistoricVariableInstance> varList = historyService.createHistoricVariableInstanceQuery().processInstanceId(hpi.getId()).list();
            Integer contractId = null;
            String reason = null;
            for (HistoricVariableInstance hvi : varList) {
                if ("contractId".equals(hvi.getVariableName())) {
                    contractId = (Integer) hvi.getValue();
                } else if ("reason".equals(hvi.getVariableName())) {
                    reason = (String) hvi.getValue();
                }
            }
            Contract contract = getById(contractId);
            ContractSummary summary = new ContractSummary();
            BeanUtils.copyProperties(contract, summary);
            summary.setReason(reason);
            result.add(summary);
        }
        return result;
    }

    @Override
    public AjaxResult updateContract(Contract contract) {
        //1. 向合同表中更新数据
        //设置通用属性
        contract.setUpdateBy(SecurityUtils.getUsername());
        contract.setUpdateTime(LocalDateTime.now());
        contract.setStatus(TienChinConstants.CONTRACT_UNAPPROVE);
        updateById(contract);
        //2。 提交流程
        //启动流程
        Map<String, Object> vars = new HashMap<>();
        vars.put("currentUser", SecurityUtils.getUsername());
        vars.put("contractId", contract.getContractId());
        vars.put("approveUser", contract.getApproveUserName());
        vars.put("approveUserId", contract.getApproveUserId());
        Task task = taskService.createTaskQuery().processInstanceId(contract.getProcessInstanceId()).active().singleResult();
        taskService.complete(task.getId(), vars);
        return AjaxResult.success("提交成功");
    }
}