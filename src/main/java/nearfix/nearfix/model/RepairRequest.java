package nearfix.nearfix.model;

import java.util.Date;

/**
 * Model class representing a repair request made by a user.
 */
public class RepairRequest {

    private int requestId;
    private int userId;
    private String userName;
    private int categoryId;
    private String categoryName;
    private Integer repairerId;
    private String repairerName;
    private String itemName;
    private String description;
    private String urgency;
    private String status;
    private Date createdAt;
    private Date updatedAt;

    /**
     * Default constructor.
     */
    public RepairRequest() {
    }

    /**
     * Constructor with essential fields.
     * 
     * @param userId      ID of the user making the request.
     * @param categoryId  ID of the category.
     * @param itemName    Name of the item to be repaired.
     * @param description Description of the issue.
     * @param urgency     Urgency level of the request.
     */
    public RepairRequest(int userId, int categoryId, String itemName, String description, String urgency) {
        this.userId = userId;
        this.categoryId = categoryId;
        this.itemName = itemName;
        this.description = description;
        this.urgency = urgency;
        this.status = "PENDING";
    }

    /**
     * Gets the request ID.
     * 
     * @return The request ID.
     */
    public int getRequestId() {
        return requestId;
    }

    /**
     * Sets the request ID.
     * 
     * @param requestId The request ID to set.
     */
    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    /**
     * Gets the user ID.
     * 
     * @return The user ID.
     */
    public int getUserId() {
        return userId;
    }

    /**
     * Sets the user ID.
     * 
     * @param userId The user ID to set.
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * Gets the user name.
     * 
     * @return The user name.
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Sets the user name.
     * 
     * @param userName The user name to set.
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Gets the category ID.
     * 
     * @return The category ID.
     */
    public int getCategoryId() {
        return categoryId;
    }

    /**
     * Sets the category ID.
     * 
     * @param categoryId The category ID to set.
     */
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * Gets the category name.
     * 
     * @return The category name.
     */
    public String getCategoryName() {
        return categoryName;
    }

    /**
     * Sets the category name.
     * 
     * @param categoryName The category name to set.
     */
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    /**
     * Gets the repairer ID assigned to this request.
     * 
     * @return The repairer ID.
     */
    public Integer getRepairerId() {
        return repairerId;
    }

    /**
     * Sets the repairer ID assigned to this request.
     * 
     * @param repairerId The repairer ID to set.
     */
    public void setRepairerId(Integer repairerId) {
        this.repairerId = repairerId;
    }

    /**
     * Gets the repairer name.
     * 
     * @return The repairer name.
     */
    public String getRepairerName() {
        return repairerName;
    }

    /**
     * Sets the repairer name.
     * 
     * @param repairerName The repairer name to set.
     */
    public void setRepairerName(String repairerName) {
        this.repairerName = repairerName;
    }

    /**
     * Gets the item name.
     * 
     * @return The item name.
     */
    public String getItemName() {
        return itemName;
    }

    /**
     * Sets the item name.
     * 
     * @param itemName The item name to set.
     */
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    /**
     * Gets the description of the repair request.
     * 
     * @return The description.
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the description of the repair request.
     * 
     * @param description The description to set.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * Gets the urgency level.
     * 
     * @return The urgency.
     */
    public String getUrgency() {
        return urgency;
    }

    /**
     * Sets the urgency level.
     * 
     * @param urgency The urgency to set.
     */
    public void setUrgency(String urgency) {
        this.urgency = urgency;
    }

    /**
     * Gets the status of the request (e.g., PENDING, COMPLETED).
     * 
     * @return The status.
     */
    public String getStatus() {
        return status;
    }

    /**
     * Sets the status of the request.
     * 
     * @param status The status to set.
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * Gets the creation date of the request.
     * 
     * @return The creation date.
     */
    public Date getCreatedAt() {
        return createdAt;
    }

    /**
     * Sets the creation date of the request.
     * 
     * @param createdAt The creation date to set.
     */
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    /**
     * Gets the last update date of the request.
     * 
     * @return The update date.
     */
    public Date getUpdatedAt() {
        return updatedAt;
    }

    /**
     * Sets the last update date of the request.
     * 
     * @param updatedAt The update date to set.
     */
    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    /**
     * Returns a string representation of the RepairRequest.
     * 
     * @return A string containing key request details.
     */
    @Override
    public String toString() {
        return "RepairRequest{" +
                "requestId=" + requestId +
                ", itemName='" + itemName + '\'' +
                ", status='" + status + '\'' +
                ", urgency='" + urgency + '\'' +
                '}';
    }
}
