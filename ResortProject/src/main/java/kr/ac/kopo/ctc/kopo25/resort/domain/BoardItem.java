package kr.ac.kopo.ctc.kopo25.resort.domain;

import java.util.Collection;

import jakarta.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class BoardItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String title;
    private String date;

    @Column(columnDefinition = "TEXT")
    private String content;

    private String name;
    private int viewcnt;

    @ManyToOne(optional=false)
    @JoinColumn(name="user_code")
    private User user;

    @OneToMany(cascade=CascadeType.ALL, mappedBy="boardItem", fetch = FetchType.LAZY)
    private Collection<BoardComment> boardComment;
}

