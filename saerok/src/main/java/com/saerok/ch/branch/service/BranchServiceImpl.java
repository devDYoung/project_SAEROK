package com.saerok.ch.branch.service;

import com.saerok.ch.branch.mapper.BranchMapper;
import com.saerok.ch.branch.model.dto.Branch;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BranchServiceImpl implements BranchService {

    private final BranchMapper branchMapper;

    public BranchServiceImpl(BranchMapper branchMapper) {
        this.branchMapper = branchMapper;
    }

    @Override
    public List<Branch> findAllBranches(String searchKeyword) {
        List<Branch> branches = branchMapper.findAllBranches(searchKeyword);
        branches.forEach(branch -> branch.setEmpPhone(formatPhoneNumber(branch.getEmpPhone())));
        return branches;
    }
    
    @Override
    public Branch findBranchById(int branchNo) {
        return branchMapper.findBranchById(branchNo);
    }

    @Override
    public void addBranch(Branch branch) {
        branchMapper.addBranch(branch);
    }

    @Override
    public void updateBranch(Branch branch) {
        branchMapper.updateBranch(branch);
    }

    @Override
    public void deleteBranch(int branchNo) {
        branchMapper.deleteBranch(branchNo); 
    }
    
    
    private String formatPhoneNumber(String phoneNumber) {
        if(phoneNumber != null && phoneNumber.length() == 11){
            return phoneNumber.substring(0, 3) + "-" + phoneNumber.substring(3, 7) + "-" + phoneNumber.substring(7);
        }
        return phoneNumber; 
    }
}
    
