package nearfix.nearfix.service.impl;

import nearfix.nearfix.dao.impl.RepairerDAO;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.service.iservice.IRepairerService;

import java.sql.SQLException;
import java.util.List;

/**
 * RepairerService - Business logic for repairer profiles.
 */
public class RepairerService implements IRepairerService {

    private RepairerDAO repairerDAO = new RepairerDAO();

    @Override
    public Repairer getRepairerProfile(int repairerId) throws SQLException {
        return repairerDAO.getRepairerById(repairerId);
    }

    @Override
    public boolean updateProfile(Repairer repairer) throws SQLException, ValidationException {
        if (repairer.getName() == null || repairer.getName().trim().isEmpty()) {
            throw new ValidationException("Name is required.");
        }
        return repairerDAO.updateRepairer(repairer);
    }

    @Override
    public List<Repairer> searchRepairers(String keyword, Integer categoryId, String area) throws SQLException {
        return repairerDAO.searchRepairers(keyword, categoryId, area);
    }

    @Override
    public int getPendingRepairersCount() throws SQLException {
        return repairerDAO.getPendingRepairersCount();
    }

    @Override
    public List<Repairer> getTopRepairers(int limit) throws SQLException {
        return repairerDAO.getTopRepairers(limit);
    }
}
