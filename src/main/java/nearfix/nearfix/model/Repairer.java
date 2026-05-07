package nearfix.nearfix.model;

import java.util.Date;

/**
 * Model class representing a repairer, which is a type of User.
 */
public class Repairer extends User {
    private String specialization; // e.g., "Electrical", "Plumbing", "Electronics"
    private String expertise;
    private int yearsOfExperience;
    private double rating;
    private int totalJobsCompleted;
    private Date joinDate;
    private String licenseNumber;

    /**
     * Default constructor.
     */
    public Repairer() {
        super();
    }

    /**
     * Constructor with essential fields.
     * 
     * @param name         Name of the repairer.
     * @param email        Email of the repairer.
     * @param phone        Phone number of the repairer.
     * @param passwordHash Hashed password.
     */
    public Repairer(String name, String email, String phone, String passwordHash) {
        super(name, email, phone, passwordHash, "REPAIRER");
    }

    /**
     * Gets the specialization of the repairer.
     * 
     * @return The specialization.
     */
    public String getSpecialization() {
        return specialization;
    }

    /**
     * Sets the specialization of the repairer.
     * 
     * @param specialization The specialization to set.
     */
    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    /**
     * Gets the expertise details.
     * 
     * @return The expertise details.
     */
    public String getExpertise() {
        return expertise;
    }

    /**
     * Sets the expertise details.
     * 
     * @param expertise The expertise details to set.
     */
    public void setExpertise(String expertise) {
        this.expertise = expertise;
    }

    /**
     * Gets the years of experience.
     * 
     * @return Years of experience.
     */
    public int getYearsOfExperience() {
        return yearsOfExperience;
    }

    /**
     * Sets the years of experience.
     * 
     * @param yearsOfExperience Years of experience to set.
     */
    public void setYearsOfExperience(int yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }

    /**
     * Gets the average rating of the repairer.
     * 
     * @return The rating.
     */
    public double getRating() {
        return rating;
    }

    /**
     * Sets the average rating of the repairer.
     * 
     * @param rating The rating to set.
     */
    public void setRating(double rating) {
        this.rating = rating;
    }

    /**
     * Gets the total number of jobs completed.
     * 
     * @return Total jobs completed.
     */
    public int getTotalJobsCompleted() {
        return totalJobsCompleted;
    }

    /**
     * Sets the total number of jobs completed.
     * 
     * @param totalJobsCompleted Total jobs completed to set.
     */
    public void setTotalJobsCompleted(int totalJobsCompleted) {
        this.totalJobsCompleted = totalJobsCompleted;
    }

    /**
     * Gets the join date of the repairer.
     * 
     * @return The join date.
     */
    public Date getJoinDate() {
        return joinDate;
    }

    /**
     * Sets the join date of the repairer.
     * 
     * @param joinDate The join date to set.
     */
    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    /**
     * Gets the license number of the repairer.
     * 
     * @return The license number.
     */
    public String getLicenseNumber() {
        return licenseNumber;
    }

    /**
     * Sets the license number of the repairer.
     * 
     * @param licenseNumber The license number to set.
     */
    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }
}
