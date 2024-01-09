package com.saerok.ch.branch.service;

import com.saerok.ch.branch.model.dto.Branch;
import java.util.List;

public interface BranchService {
    List<Branch> findAllBranches(String searchKeyword);
    Branch findBranchById(int branchNo);
    void addBranch(Branch branch);
    void updateBranch(Branch branch);
    void deleteBranch(int branchNo);
}
