package com.example.hello.entity;

import com.example.hello.common.enums.PostsCategory;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Entity
@Table(name="app_posts")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EntityListeners(AuditingEntityListener.class)
public class Posts {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @Column(nullable = false)
    private String title;
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private PostsCategory category;
    @Column(nullable = false)
    private Integer likeCount = 0;
    @Column(nullable = false)
    private Integer commentCount = 0;
    @Column(nullable = false)
    private Integer readCount = 0;
    @CreatedDate
    @Column(nullable = false)
    private LocalDateTime createdAt;
    @LastModifiedDate
    @Column(nullable = false)
    private LocalDateTime updatedAt;
    private LocalDateTime deletedAt;
    private Boolean isActive = true;
}
