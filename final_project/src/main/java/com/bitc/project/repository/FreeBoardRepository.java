package com.bitc.project.repository;

import com.bitc.project.vo.FreeBoardVO;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FreeBoardRepository extends JpaRepository<FreeBoardVO, Long> {
}
