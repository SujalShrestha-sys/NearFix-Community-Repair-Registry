package nearfix.nearfix.model;

/**
 * Model class representing a service category.
 */
public class Category {

    private int categoryId;
    private String name;
    private String description;

    /**
     * Default constructor.
     */
    public Category() {
    }

    /**
     * Constructor with name and description.
     * @param name Name of the category.
     * @param description Description of the category.
     */
    public Category(String name, String description) {
        this.name = name;
        this.description = description;
    }

    /**
     * Gets the category ID.
     * @return The category ID.
     */
    public int getCategoryId() {
        return categoryId;
    }

    /**
     * Sets the category ID.
     * @param categoryId The category ID to set.
     */
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * Gets the category name.
     * @return The category name.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the category name.
     * @param name The category name to set.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the category description.
     * @return The category description.
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the category description.
     * @param description The category description to set.
     */
    public void setDescription(String description) {
        this.description = description;
    }
}

