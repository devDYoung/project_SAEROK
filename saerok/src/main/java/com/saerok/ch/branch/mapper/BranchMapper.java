package com.saerok.ch.branch.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.saerok.ch.branch.model.dto.Branch;

@Mapper  
public interface BranchMapper {
    List<Branch> findAllBranches(@Param("searchKeyword") String searchKeyword);
    Branch findBranchById(int branchNo);
    void addBranch(Branch branch); 
    void updateBranch(Branch branch); 
    void deleteBranch(int branchNo);
}
