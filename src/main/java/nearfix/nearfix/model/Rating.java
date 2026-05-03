package nearfix.nearfix.model;

import java.sql.Timestamp;

/**
 * Model class representing a rating given by a user to a repairer.
 */
public class Rating {
    private int ratingId;
    private int requestId;
    private int userId;
    private String userName;
    private int repairerId;
    private String repairerName;
    private int ratingScore;
    private String comment;
    private Timestamp createdAt;

    /**
     * Default constructor.
     */
    public Rating() {
    }

    /**
     * Gets the rating ID.
     * @return The rating ID.
     */
    public int getRatingId() {
        return ratingId;
    }

    /**
     * Sets the rating ID.
     * @param ratingId The rating ID to set.
     */
    public void setRatingId(int ratingId) {
        this.ratingId = ratingId;
    }

    /**
     * Gets the repair request ID.
     * @return The request ID.
     */
    public int getRequestId() {
        return requestId;
    }

    /**
     * Sets the repair request ID.
     * @param requestId The request ID to set.
     */
    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    /**
     * Gets the user ID of the person who gave the rating.
     * @return The user ID.
     */
    public int getUserId() {
        return userId;
    }

    /**
     * Sets the user ID of the person who gave the rating.
     * @param userId The user ID to set.
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * Gets the name of the user who gave the rating.
     * @return The user name.
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Sets the name of the user who gave the rating.
     * @param userName The user name to set.
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Gets the ID of the repairer being rated.
     * @return The repairer ID.
     */
    public int getRepairerId() {
        return repairerId;
    }

    /**
     * Sets the ID of the repairer being rated.
     * @param repairerId The repairer ID to set.
     */
    public void setRepairerId(int repairerId) {
        this.repairerId = repairerId;
    }

    /**
     * Gets the name of the repairer being rated.
     * @return The repairer name.
     */
    public String getRepairerName() {
        return repairerName;
    }

    /**
     * Sets the name of the repairer being rated.
     * @param repairerName The repairer name to set.
     */
    public void setRepairerName(String repairerName) {
        this.repairerName = repairerName;
    }

    /**
     * Gets the rating score (e.g., 1 to 5).
     * @return The rating score.
     */
    public int getRatingScore() {
        return ratingScore;
    }

    /**
     * Sets the rating score.
     * @param ratingScore The rating score to set.
     */
    public void setRatingScore(int ratingScore) {
        this.ratingScore = ratingScore;
    }

    /**
     * Gets the comment associated with the rating.
     * @return The comment text.
     */
    public String getComment() {
        return comment;
    }

    /**
     * Sets the comment associated with the rating.
     * @param comment The comment text to set.
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * Gets the timestamp when the rating was created.
     * @return The creation timestamp.
     */
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    /**
     * Sets the timestamp when the rating was created.
     * @param createdAt The creation timestamp to set.
     */
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}

