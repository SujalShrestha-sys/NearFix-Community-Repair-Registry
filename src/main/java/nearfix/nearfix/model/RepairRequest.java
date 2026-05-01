package nearfix.nearfix.model;

import java.util.Date;

public class RepairRequest {

    private int requestId;
    private int userId;
    private String userName;
    // private String userEmail;
    // private String userPhone;
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

    public RepairRequest() {
    }

    public RepairRequest(int userId, int categoryId, String itemName, String description, String urgency) {
        this.userId = userId;
        this.categoryId = categoryId;
        this.itemName = itemName;
        this.description = description;
        this.urgency = urgency;
        this.status = "PENDING";
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Integer getRepairerId() {
        return repairerId;
    }

    public void setRepairerId(Integer repairerId) {
        this.repairerId = repairerId;
    }

    public String getRepairerName() {
        return repairerName;
    }

    public void setRepairerName(String repairerName) {
        this.repairerName = repairerName;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrgency() {
        return urgency;
    }

    public void setUrgency(String urgency) {
        this.urgency = urgency;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

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
