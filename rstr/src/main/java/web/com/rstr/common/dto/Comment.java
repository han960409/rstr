package web.com.rstr.common.dto;

import java.time.LocalDateTime;

public class Comment {
    private Long id;
    private String body;
    private String userId;   // ← Long → String으로 변경
    private Long reviewId;
    private LocalDateTime createdAt;

    public Comment() { super(); }

    public Comment(Long id, String body, String userId, Long reviewId, LocalDateTime createdAt) {
        this.id = id;
        this.body = body;
        this.userId = userId;
        this.reviewId = reviewId;
        this.createdAt = createdAt;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getBody() { return body; }
    public void setBody(String body) { this.body = body; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }  // 타입 수정

    public Long getReviewId() { return reviewId; }
    public void setReviewId(Long reviewId) { this.reviewId = reviewId; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}