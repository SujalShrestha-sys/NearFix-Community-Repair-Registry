package nearfix.nearfix.model;

import java.sql.Timestamp;

/**
 * Model class representing a job saved by a repairer for future reference.
 */
public class SavedJob {
    private int saveId;
    private int repairerId;
    private int requestId;
    private Timestamp savedAt;
    private String itemName;
    private String categoryName;
    private String urgency;

    /**
     * Default constructor.
     */
    public SavedJob() {
    }

    /**
     * Gets the save ID.
     * @return The save ID.
     */
    public int getSaveId() {
        return saveId;
    }

    /**
     * Sets the save ID.
     * @param saveId The save ID to set.
     */
    public void setSaveId(int saveId) {
        this.saveId = saveId;
    }

    /**
     * Gets the ID of the repairer who saved the job.
     * @return The repairer ID.
     */
    public int getRepairerId() {
        return repairerId;
    }

    /**
     * Sets the ID of the repairer who saved the job.
     * @param repairerId The repairer ID to set.
     */
    public void setRepairerId(int repairerId) {
        this.repairerId = repairerId;
    }

    /**
     * Gets the ID of the repair request.
     * @return The request ID.
     */
    public int getRequestId() {
        return requestId;
    }

    /**
     * Sets the ID of the repair request.
     * @param requestId The request ID to set.
     */
    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    /**
     * Gets the timestamp when the job was saved.
     * @return The saved timestamp.
     */
    public Timestamp getSavedAt() {
        return savedAt;
    }

    /**
     * Sets the timestamp when the job was saved.
     * @param savedAt The saved timestamp to set.
     */
    public void setSavedAt(Timestamp savedAt) {
        this.savedAt = savedAt;
    }

    /**
     * Gets the item name associated with the saved job.
     * @return The item name.
     */
    public String getItemName() {
        return itemName;
    }

    /**
     * Sets the item name associated with the saved job.
     * @param itemName The item name to set.
     */
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    /**
     * Gets the category name of the saved job.
     * @return The category name.
     */
    public String getCategoryName() {
        return categoryName;
    }

    /**
     * Sets the category name of the saved job.
     * @param categoryName The category name to set.
     */
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    /**
     * Gets the urgency level of the saved job.
     * @return The urgency level.
     */
    public String getUrgency() {
        return urgency;
    }

    /**
     * Sets the urgency level of the saved job.
     * @param urgency The urgency level to set.
     */
    public void setUrgency(String urgency) {
        this.urgency = urgency;
    }
}

