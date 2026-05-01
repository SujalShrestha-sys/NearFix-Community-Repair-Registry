package nearfix.nearfix.model;

import java.util.Date;

public class Repairer extends User {
    private String specialization; // e.g., "Electrical", "Plumbing", "Electronics"
    private String expertise;
    private int yearsOfExperience;
    private double rating;
    private int totalJobsCompleted;
    private Date joinDate;
    private String licenseNumber;
    private boolean verificationStatus;

    public Repairer() {
        super();
    }

    public Repairer(String name, String email, String phone, String passwordHash) {
        super(name, email, phone, passwordHash, "REPAIRER");
    }

    // Getters and Setters
    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getExpertise() {
        return expertise;
    }

    public void setExpertise(String expertise) {
        this.expertise = expertise;
    }

    public int getYearsOfExperience() {
        return yearsOfExperience;
    }

    public void setYearsOfExperience(int yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getTotalJobsCompleted() {
        return totalJobsCompleted;
    }

    public void setTotalJobsCompleted(int totalJobsCompleted) {
        this.totalJobsCompleted = totalJobsCompleted;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public boolean isVerificationStatus() {
        return verificationStatus;
    }

    public void setVerificationStatus(boolean verificationStatus) {
        this.verificationStatus = verificationStatus;
    }
}
